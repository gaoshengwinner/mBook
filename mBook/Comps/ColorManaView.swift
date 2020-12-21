//
//  MBColorSelectorView.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/08.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct ColorManaView: View {
    //@State private var manaColorList:[ManaColor]
    @EnvironmentObject var model: Model
    //@ObservedObject var manaColorLisnter = ManaColorLisnter()
    @State var newManaColor:ManaColor = ManaColor()
    
    var body: some View {
        ZStack {
            Color(.systemGray5)
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            self.colorList
        }.background(Color(.systemGray5))
        .navigationBarTitle("Color管理",displayMode: .inline)
        .onDisappear(){
        }
    }
    
    
    var colorList: some View{
        return List{
            if self.model.manaColorList.count > 0 {
                Section(header: Text("")){
                    ForEach(0..<self.model.manaColorList.count, id: \.self){ colorI in
                        if self.model.manaColorList[colorI].beUse {
                            ColorLinkView(colorI: colorI)
                        }
                    }
                    .onDelete(perform: deleteManaColorList)
                }
                if haveNoAddedColor() {
                    Section(header: Text("Add Color")){
                        ForEach(0..<self.model.manaColorList.count, id: \.self){ colorI in
                            if !self.model.manaColorList[colorI].beUse {
                                ColorLinkView(colorI: colorI)
                            }
                        }.onDelete(perform: deleteManaColorList)
                    }
                }
            }
            Section(header: Text("")){
                ColorLinkView(colorI: nil)
            }
        }
        .onChange(of: self.model.manaColorList, perform: { value in
            for i in 0..<self.model.manaColorList.count {
                var mc = self.model.manaColorList[i]
                if (mc.beChanged ?? false) {
                    mc.beChanged = false
                    APIHelper.saveManaColor(manaColor: mc) { _ in
                        print("OK");
                    } whenNG: { msg in
                        print("whenNG");
                    } whenTokenNG: { (_, _) in
                        print("whenTokenNG");
                    }
                }
            }
        })
        .onChange(of: self.newManaColor, perform: { value in
            if self.newManaColor.name != "" {
                self.newManaColor.beChanged = false
                APIHelper.saveManaColor(manaColor: self.newManaColor) {result in
                    DispatchQueue.main.async{
                    self.model.manaColorList.append(result![0])
                    self.newManaColor = ManaColor()
                    }
                    print("OK");
                } whenNG: {_ in
                    print("whenNG");
                } whenTokenNG: { (_, _) in
                    print("whenTokenNG");
                }
            }
        })
        
    }
    
    
    func deleteManaColorList(at offsets:IndexSet){
        APIHelper.deleteManaColor(manaColor: self.model.manaColorList[offsets.first!]) {
            
        } whenNG: { (msg) in
            
        } whenTokenNG: { (reLogin, msg) in
            
        }

        self.model.manaColorList.remove(at: offsets.first!)
    }
    
    func haveNoAddedColor()->Bool{
        for mc in self.model.manaColorList {
            if !mc.beUse {
                return true;
            }
        }
        return false
    }
    
    func ColorLinkView(colorI:Int? )-> some View{
        NavigationLink(destination: ColorDetailView(manaColor: colorI == nil ? self.$newManaColor : self.$model.manaColorList[colorI!])
        ){
            HStack(alignment: .center){
                if colorI == nil {
                    Text("Add New Color")
                } else {
                    self.model.manaColorList[colorI!].mbColor.toColor()
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    Text(
                        
                        colorI == nil ? "" :
                            "\(self.model.manaColorList[colorI!].id!):\(self.model.manaColorList[colorI!].name)"
                    ).foregroundColor(Color(.black))
                }
                
            }.background(Color(.white))
        }
        
    }
}


struct ColorDetailView: View {
    @Binding var manaColor:ManaColor
    @State var beChange = false
    var body: some View {
        List{
            Section(header: Text("")) {
                HStack{
                    Text("Color Number")
                    Spacer()
                    Text(manaColor.id == nil ? "" : "\(manaColor.id!)")
                    
                }
                HStack{
                    Text("Name")
                    Spacer()
                    TextField("Name", text: $manaColor.name)
                        .setTextFieldStyle()
                        .onChange(of: manaColor.name, perform: { value in
                            manaColor.beChanged = true
                        })
                }
//                NavigationLink(
//                    destination: TextField("Name", text: $manaColor.name)
//                        .setTextFieldStyle()
//                        .onChange(of: manaColor.name, perform: { value in
//                            
//                            manaColor.beChanged = true
//                        }),
//                    label: {
//                        HStack{
//                            Text("Name")
//                            Spacer()
//                            Text(manaColor.name)
//                        }
//                    })
                    
              
                
                HStack{
                    Text("Color Value")
                    Spacer()
                    ColorSelectorView(mbColor: $manaColor.mbColor, beChange: $beChange)
                        .onChange(of: manaColor.mbColor, perform: { value in
                            manaColor.beChanged = true
                        })
                }
            }
            
            Section(header: Text("")) {
                HStack{
                    Text("Can Be Use")
                    Spacer()
                    Toggle(isOn: $manaColor.beUse){}
                        .onTapGesture {
                            manaColor.beChanged = true
                        }
                }
            }
        }
        .navigationBarTitle("Color Detail",displayMode: .inline)
        
        
    }
    
    
}


struct ColorSelectorView: View {
    @Binding var mbColor:MBColor
    @State  var bgColor:Color = Color.white
    @Binding var beChange:Bool
    
    init(mbColor:Binding<MBColor>, beChange:Binding<Bool>) {
        self._mbColor = mbColor
        self._bgColor = State(wrappedValue: mbColor.wrappedValue.toColor())
        self._beChange = beChange
    }
    
    var example: some View{
        VStack{
            VStack {
                HStack{
                    VStack{
                        
                        ColorPicker(selection: $bgColor, label: {
                            Text("")
                        })
                        
                        .padding()
                        .onChange(of: bgColor, perform: { value in
                            mbColor.blue = bgColor.blue255
                            mbColor.green = bgColor.green255
                            mbColor.red = bgColor.red255
                            mbColor.opacity = bgColor.opacity100
                        })
                        .onChange(of: mbColor, perform: { value in
                            if beChange {
                                bgColor = mbColor.toColor()
                                beChange = false
                            }
                        })
//                        .onChange(of: mbColor.blue, perform: { value in
//                            bgColor = Color(red: bgColor.redOld, green: bgColor.greenOld, blue: mbColor.blue, opacity: bgColor.opacityOld)
//                        })
//                        .onChange(of: mbColor.green, perform: { value in
//                            bgColor = Color(red: bgColor.redOld, green: mbColor.green, blue: bgColor.blueOld, opacity: bgColor.opacityOld)
//                        })
//                        .onChange(of: mbColor.opacity, perform: { value in
//                            bgColor = Color(red: bgColor.redOld, green: bgColor.greenOld, blue: bgColor.blueOld, opacity: mbColor.opacity)
//                        })
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
        }.onAppear(){
            self.bgColor = self.mbColor.toColor()
        }
    }
    
    
    var body: some View {
        VStack{
            example
            Spacer()
        }.padding()
        .onTapGesture {
            // 键盘收起
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
    }
}



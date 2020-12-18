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
    @ObservedObject var manaColorLisnter = ManaColorLisnter()
    
//    static func  getManaColorList()->[ManaColor]{
//        let  list =  [ManaColor(id: 1, name: "Clor Name1", mbColor: MBColor.white()),
//                ManaColor(id: 2, name: "Clor Name2", mbColor: MBColor.black()),
//                ManaColor(id: 3, name: "Clor Name2", mbColor: MBColor.black()),
//                ManaColor(id: 4, name: "Clor Name2", mbColor: MBColor.black()),
//                ManaColor(id: 5, name: "Clor Name2", mbColor: MBColor.black()),
//                ManaColor(id: 6, name: "Clor Name2", mbColor: MBColor.black()),
//                ManaColor(id: 7, name: "Clor Name2", mbColor: MBColor.black()),
//                ManaColor(id: 8, name: "Clor Name2", mbColor: MBColor.black()),
//                ManaColor(id: 9, name: "Clor Name2", mbColor: MBColor.black()),
//                ManaColor(id: 10, name: "Clor Name2", mbColor: MBColor.black()),
//                ManaColor(id: 11, name: "Clor Name2", mbColor: MBColor.black())]
//
//        return list
//    }
    
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
            Section(header: Text("")){
                ForEach(0..<self.manaColorLisnter.manaColorList.count){ colorI in
                    if self.manaColorLisnter.manaColorList[colorI].isUse {
                        ColorLinkView(colorI: colorI)
                    }
                }
            }
            if haveNoAddedColor() {
                Section(header: Text("Add Color")){
                    ForEach(0..<self.manaColorLisnter.manaColorList.count){ colorI in
                        if !self.manaColorLisnter.manaColorList[colorI].isUse {
                            ColorLinkView(colorI: colorI)
                        }
                    }
                }
            }
            
            
        }
    }
    func haveNoAddedColor()->Bool{
        for mc in self.manaColorLisnter.manaColorList {
            if !mc.isUse {
                return true;
            }
        }
        return false
    }
    func ColorLinkView(colorI:Int )-> some View{
        NavigationLink(destination: ColorDetailView(manaColor: self.$manaColorLisnter.manaColorList[colorI])
        ){
            HStack(alignment: .center){
                self.manaColorLisnter.manaColorList[colorI].mbColor.toColor()
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                //.padding(.leading)
                Text(self.manaColorLisnter.manaColorList[colorI].id == nil ? "" : "\(self.manaColorLisnter.manaColorList[colorI].id!):\(self.manaColorLisnter.manaColorList[colorI].name)"
                ).foregroundColor(Color(.black))
            }.background(Color(.white))
        }
    }
}


struct ColorDetailView: View {
    @Binding var manaColor:ManaColor
    var body: some View {
        return List{
            Section(header: Text("")) {
                HStack{
                    Text("Color Number")
                    Spacer()
                    Text(manaColor.id == nil ? "" : "\(manaColor.id!)")
                    
                }
                NavigationLink(
                    destination:
                        List{
                            Section(header: Text(""), content: {
                                TextField("Name", text:$manaColor.name)
                                
                            })
                        }
                ) {
                    HStack{
                        Text("Name")
                        Spacer()
                        Text("\(manaColor.name)")
                    }
                }
                
                if #available(iOS 14.0, *) {
                    HStack{
                        Text("Color Value")
                        Spacer()
                        ColorSelectorView(mbColor: $manaColor.mbColor)
                    }
                } else {
                    Text("TODO ")
                }
                
                
            }
            
            Section(header: Text("")) {
                HStack{
                    Text("Can Be Use")
                    Spacer()
                    Toggle(isOn: $manaColor.isUse) {}
                }
            }
        }
        .navigationBarTitle("Color Detail",displayMode: .inline)
    }
    
    
}


struct ColorSelectorView: View {
    @Binding var mbColor:MBColor
    @State  var bgColor:Color = Color.white
    
    var example: some View{
        VStack{
            VStack {
                if #available(iOS 14.0, *) {
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
                        }
                    }
                }
                
//                HStack{
//                    VStack(alignment:HorizontalAlignment.leading){
//                        Text(String(format:"RGBO(%.0f,%.0f,%.0f,%.0f)", mbColor.red,mbColor.green, mbColor.blue, mbColor.opacity))
//                            .font(.body)
//                    }
//                }
                
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

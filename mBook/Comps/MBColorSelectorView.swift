//
//  MBColorSelectorView.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/08.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI


struct MemoMBColor :Identifiable{
    var id = UUID()
    var title = ""
    var color = MBColor()
}

struct MemoMBColorHStack:Identifiable{
    var id = UUID()
    var memoColorSlider = [MemoMBColor]()
}


struct MBColorSelectorView: View {
    @Binding var manaColor:ManaColor
    @State var manaColorList: [ManaColor]
    @State var checked:[Bool]
    @State var last:Int
    @State var isInet = true
    @State var beChange = false
    var onSelect:(_ manaColor: ManaColor)->Void
    init(_ manaColor: Binding<ManaColor>, _ manaColorList:[ManaColor] ,onSelect:@escaping (_ manaColor: ManaColor)->Void) {
        self._manaColor = manaColor
        var checkedInit = [Bool]()
        var beSetting = false
        for i in 0..<manaColorList.count {
            if manaColor.wrappedValue.id == manaColorList[i].id {
                checkedInit.append(true)
                beSetting = true
            } else {
                checkedInit.append(false)
            }
        }
        self._last = State(initialValue: manaColorList.count)
        
        checkedInit.append(!beSetting)
        self._checked = State(initialValue: checkedInit)
        
        
        self._manaColorList = State(wrappedValue: manaColorList)
        self.onSelect = onSelect
    }
    var body: some View {
        
        return VStack{
            Text(String(format:"R:%.0f,G:%.0f,B:%.0f,O:%.0f", manaColor.mbColor.red,manaColor.mbColor.green, manaColor.mbColor.blue, manaColor.mbColor.opacity))
                .foregroundColor(.black)
                .background(self.manaColor.mbColor.toColor())
                .font(.body)
                .onChange(of: self.manaColor.mbColor, perform: { value in
                    onSelect(self.manaColor)
                })
            List{
                
                HStack{
                    Text("Once color")
                        .foregroundColor(Color(.black))
                    ColorSelectorView(mbColor: $manaColor.mbColor, beChange: $beChange)
                        
                    Spacer()
                    Toggle(isOn: $checked[self.last], label: {
                        Text("")
                    })
                    .onTapGesture {
                        setToggleState(self.last)
                    }
                }
                //Picker("Predefined Color", selection: $numberOfPeople) {
                ForEach(0..<self.manaColorList.count) {colorI in
                    HStack{
                        self.manaColorList[colorI].mbColor.toColor()
                            .clipShape(Circle())
                            .frame(width: 30, height: 30)
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                        
                        Text("\(self.manaColorList[colorI].id!):\(self.manaColorList[colorI].name)"
                        ).foregroundColor(Color(.black))
                        
                        
                        Spacer()
                        
                        Toggle(isOn: $checked[colorI], label: {
                            Text("")
                        })
                        .onTapGesture {
                            setToggleState(colorI)
                        }
                        
                        
                    }
                }
            }
            .font(.system(size: 18))
        }
        
        
    }
    
    func setToggleState(_ colorI:Int){
        beChange = true
        if !self.checked[colorI] {
            for i in 0..<self.checked.count {
                if (i != colorI) {
                    self.checked[i] = false
                }
            }
            if colorI < self.last {
                manaColor = self.manaColorList[colorI]
                manaColor.mbColor.red = self.manaColorList[colorI].mbColor.red
                manaColor.mbColor.blue = self.manaColorList[colorI].mbColor.blue
                manaColor.mbColor.green = self.manaColorList[colorI].mbColor.green
                manaColor.mbColor.opacity = self.manaColorList[colorI].mbColor.opacity
            } else {
                manaColor.id = nil
                manaColor.name = ""
            }
        } else {
            self.checked[colorI] = true
        }
    }
}



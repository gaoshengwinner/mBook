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
    @Binding var mbColor:MBColor
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var memos = [MemoMBColor]()
    var onSelect:(_ colorSlider: MBColor)->Void
    var example: some View{
        VStack{
            VStack{
                Text("Hello Meel Book!")
            }
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 30)
            .background(Color.init(red: mbColor.red / 255, green: mbColor.green / 255, blue: mbColor.blue / 255, opacity: mbColor.opacity / 100))
            .cornerRadius(.infinity)
            
            HStack{
                VStack(alignment:HorizontalAlignment.leading){
                    Text(String(format:"Red:%.0f,Green:%.0f,Blue:%.0f", mbColor.red,mbColor.green, mbColor.blue))
                        .font(.body)
                    Text(String(format:"Opacity:%.0f", mbColor.opacity))
                        .font(.body)
                }
                .foregroundColor(Color.init(red: mbColor.red / 255, green: mbColor.green / 255, blue: mbColor.blue / 255, opacity: mbColor.opacity / 100))
            }
        }
    }
    
    var cont: some View {
        VStack(alignment:.trailing, spacing: 0){
            Divider()
            HStack{
                Text("R").foregroundColor(.red).onTapGesture {
                    if self.mbColor.red > 1{self.mbColor.red = self.mbColor.red - 1}
                }
                Slider(value: $mbColor.red, in: 0...255, step: 1)
                    .frame(width:UIScreen.main.bounds.width*0.55)
                Text("255").foregroundColor(.red).onTapGesture {
                    if self.mbColor.red < 255 {self.mbColor.red = self.mbColor.red + 1}
                }
            }
            HStack{
                Text("G").foregroundColor(.green).onTapGesture {
                    if self.mbColor.green > 1 {self.mbColor.green = self.mbColor.green - 1}
                }
                Slider(value: $mbColor.green, in: 0...255, step: 1)
                    .frame(width:UIScreen.main.bounds.width*0.55)
                Text("255").foregroundColor(.green).onTapGesture {
                    if self.mbColor.green < 255{ self.mbColor.green = self.mbColor.green + 1}
                }
            }
            HStack{
                Text("B").foregroundColor(.blue).onTapGesture {
                    if self.mbColor.blue > 1 {self.mbColor.blue = self.mbColor.blue - 1}
                }
                Slider(value: $mbColor.blue, in: 0...255, step: 1)
                    .frame(width:UIScreen.main.bounds.width*0.55)
                Text("255").foregroundColor(.blue).onTapGesture {
                    if self.mbColor.blue < 255 {self.mbColor.blue = self.mbColor.blue + 1}
                }
            }
            HStack{
                Text("O").onTapGesture {
                    if self.mbColor.opacity > 1 {self.mbColor.opacity = self.mbColor.opacity - 1}
                }
                Slider(value: $mbColor.opacity, in: 0...100, step: 1)
                    .frame(width:UIScreen.main.bounds.width*0.55)
                Text("100").onTapGesture {
                    if self.mbColor.opacity < 100 {self.mbColor.opacity = self.mbColor.opacity + 1}
                }
            }
        }.padding()
    }
    static let dispCount = 4
    @State var title:String=""
    @State var keyBordvalue:CGFloat=0
    @State var allMemos = [MemoMBColorHStack]()
    let circleR = (UIScreen.main.bounds.width - 51.0) / CGFloat(dispCount + 1)
    var memo: some View {
        ZStack{
            VStack{
                ScrollView{
                    self.memolistView
                    Spacer()
                }
            }
            
            VStack{
                Spacer()
                
                HStack(alignment: .bottom){
                    TextField("色のメモ名", text: $title)
                        
                        .setTextFieldStyle()
                        .foregroundColor(Color.black)
                    Spacer()
                    Button (action:{
                        self.memos.append(MemoMBColor(title:self.title,color: MBColor(red: self.mbColor.red, green: self.mbColor.green, blue: self.mbColor.blue, opacity: self.mbColor.opacity)))
                        self.title = ""
                        self.allMemos = self.getAllMemos()
                        // 键盘收起
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        
                    } ) {
                        Image(systemName: "plus.circle.fill").foregroundColor(title.isEmpty ?  .gray :.blue)
                            .font(.largeTitle)
                    }
                    .disabled(title.isEmpty)
                }.background(Color.init(red: 220, green: 220, blue: 220, opacity: 1))
            }
            
        }
    }
    
    var memolistView :some View {
        Group{
            ForEach (self.allMemos, id:\.id) { submemos in
                VStack(alignment: .leading,spacing:0){
                    HStack(alignment:.top, spacing:0){
                        ForEach (submemos.memoColorSlider, id:\.id) { memo in
                            VStack(spacing:0){
                                Circle()
                                    .fill(Color.init(red: memo.color.red / 255, green: memo.color.green / 255, blue: memo.color.blue / 255, opacity: memo.color.opacity / 100))
                                    .frame(width:self.circleR,height: self.circleR)
                                    .padding(0)
                                Text(memo.title) .font(.system(size: 20))
                                    .foregroundColor(Color.black)
                                    .padding(0)
                            }.padding(5)
                            .onTapGesture(){
                                self.mbColor = memo.color
                            }
                            .onLongPressGesture {
                                self.removeMemo(memo:memo)
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    func getAllMemos() -> Array<MemoMBColorHStack> {
        // 计算表示行数
        var allMemos = Array<MemoMBColorHStack>()
        var i = 0, j = 0
        var subMemos = MemoMBColorHStack()
        
        for m in self.memos {
            subMemos.memoColorSlider.append(m)
            j = j + 1
            i = i + 1
            if i > MBColorSelectorView.dispCount || j >= self.memos.count {
                i = 0
                allMemos.append(subMemos)
                subMemos = MemoMBColorHStack()
            }
        }
        return allMemos
    }
    
    func removeMemo(memo:MemoMBColor){
        for i in 0..<self.memos.count {
            if self.memos[i].id == memo.id {
                self.memos.remove(at: i)
                break
            }
            
        }
        self.allMemos = self.getAllMemos()
    }
    var body: some View {
        VStack{
            example
            cont
            HStack(alignment:.center){
                Text("OK").setStyleToLikeButton(width: 0.4)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                        self.onSelect(self.mbColor)
                    }
            }.padding(.top)
            self.memo
            Spacer()
        }.padding()
        .onTapGesture {
            // 键盘收起
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
    }
}



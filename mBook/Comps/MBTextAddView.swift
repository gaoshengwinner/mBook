//
//  MBTextAddView.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/14.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI





struct MBTextAddView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var hDetail:HDetail = HDetail()
    @State var item:ItemDetail
    var onSelect:(_ hDetail: HDetail)->Void
    var body: some View {
        ZStack{
            Color.init(UIColor.systemGray6)
                .edgesIgnoringSafeArea(.bottom)
            VStack{
                List {
                    ForEach(0..<self.hDetail.mBItemDetailList.count, id: \.self) { i in
                        if self.hDetail.mBItemDetailList[i].isEnable {
                            if self.hDetail.mBItemDetailList[i].type == .ITEM_NAME {
                                Text("商品名")
                            } else if self.hDetail.mBItemDetailList[i].type == .ITEM_PRICE {
                                Text("商品販売価格")
                            } else if  self.hDetail.mBItemDetailList[i].type == .ITEM_DESCR {
                                Text("商品説明")
                            } else if  self.hDetail.mBItemDetailList[i].type == .ITEM_FREESTRING {
                                CommentInputView(text: self.$hDetail.mBItemDetailList[i].text)
                                    .background(Color.red)
                                    .frame(height:100)
                            } else {
                                CommentInputView(text: self.$hDetail.mBItemDetailList[i].text)
                                    .background(Color.red)
                                    .frame(height:100)
                            }
                            
                        }
                    }
                    .onDelete(perform: deleteHtextList)
                }.font(.body).foregroundColor(self.colorScheme == .dark ? .white:.black)
                preText
                Spacer()
                menubar
            }
            .background(Color.white)
            .setOnTapCloseKeyBoard()
            //.edgesIgnoringSafeArea(.bottom)
        }.setOnTapCloseKeyBoard()
        
        
    }
    
    func deleteHtextList(at offsets:IndexSet){
        self.hDetail.mBItemDetailList[offsets.first!].isEnable = false
    }
    
    @State var addTarger = false
    @State var textJustfyUp = false
    @State var grounfColorUp = false
    @State var manaColor:ManaColor = ManaColor()
    
    @EnvironmentObject var model: Model
    @State var textFontSizeUp = false
    @State var textFontSize:CGFloat = 20
    var menubar : some View {
        Group{
            HStack{
                Spacer()
                Image(systemName: "plus.circle")
                    .onTapGesture {
                        self.addTarger.toggle()
                    }
                    .font(.largeTitle)
                    .actionSheet(isPresented: $addTarger) {
                        ActionSheet(title: Text("商品情報選択"),  buttons: [
                            .default(Text("商品名")){
                                self.hDetail.mBItemDetailList.append(MBItemDetail(type: MBItemDetailType.ITEM_NAME))
                            },
                            .default(Text("商品販売価格")){
                                self.hDetail.mBItemDetailList.append(MBItemDetail(type: MBItemDetailType.ITEM_PRICE))
                            },
                            .default(Text("商品説明")){
                                self.hDetail.mBItemDetailList.append(MBItemDetail(type: MBItemDetailType.ITEM_DESCR))
                            },
                            .default(Text("自由文字")){
                                self.hDetail.mBItemDetailList.append(MBItemDetail(type: MBItemDetailType.ITEM_FREESTRING))
                            },
                            
                            //ITEM_FREESTRING
                            .destructive(Text("Cancel"))
                        ])
                    }
                Spacer()
                Group{
                    Image(systemName: "paintbrush")
                        .onTapGesture {
                            self.manaColor.mbColor = self.hDetail.textBackgroudColor
                            self.grounfColorUp.toggle()
                        }
                        .setMBColorWithSheet(isPresented: self.$grounfColorUp, model: model, manaColor: self.$manaColor, onSelect: { manaColor in
                            self.hDetail.textBackgroudColor = manaColor.mbColor
                        })
                    Spacer()
                    Image(systemName: "textformat.size")
                        .onTapGesture {
                            self.textFontSize = self.hDetail.textFontSize
                            self.textFontSizeUp.toggle()
                        }
                        .setMBFontSizeWithSheet(isPresented: $textFontSizeUp, textFontSize: self.textFontSize) { sr in
                            self.hDetail.textFontSize = sr
                        }
                    Spacer()
                    Image(systemName: "text.justify")
                        .onTapGesture {
                            self.textJustfyUp.toggle()
                        }
                        .actionSheet(isPresented: $textJustfyUp) {
                            ActionSheet(title: Text("揃え"), buttons: [
                                .default(Text("左揃え")){
                                    self.hDetail.alignment = "1"
                                },
                                .default(Text("中央揃え")){
                                    self.hDetail.alignment = "2"
                                },
                                .default(Text("右揃え")){
                                    self.hDetail.alignment = "3"
                                },
                                .destructive(Text("Cancel"))
                            
                            ])
                        }
                    Spacer()
                }
                Image(systemName: "checkmark.rectangle")
                    .font(.largeTitle)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                        self.onSelect(self.hDetail)
                    }
                Spacer()
            }
            .background(Color.init(UIColor.systemGray6))
            
        }
    }
    
    var preText : some View {
        var string = ""
        for htext in self.hDetail.mBItemDetailList {
            if htext.isEnable == true{
                if htext.type == .ITEM_NAME {
                    string = string + self.item.itemName
                }else if htext.type == .ITEM_PRICE {
                    string = string + self.item.itemPrice
                }else if htext.type == .ITEM_DESCR {
                    string = string + self.item.itemDescr
                }else if htext.type == .ITEM_FREESTRING {
                    string = string + htext.text
                } else {
                    string = string + htext.text
                    
                }
            }
        }
        return VStack(alignment:.leading, spacing: 0) {
            HStack(alignment:.top,spacing: 0) {
                Text(string)
                    .font(Font.system(size: UIFontMetrics.default.scaledValue(for: self.hDetail.textFontSize)))
                    .padding()
                   // .frame(width: UIScreen.main.bounds.width*(1-0.05), alignment: .center)
            }.padding(0)
            .foregroundColor(self.hDetail.textColor.toColor())
            .background(self.hDetail.textBackgroudColor.toColor())
            .cornerRadius(5)
            
            
            
        }
    }
}

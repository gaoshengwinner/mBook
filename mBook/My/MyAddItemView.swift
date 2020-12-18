//
//  MyAddItemView.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/02.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct MyAddItemView: View {
    @EnvironmentObject var model: Model
    @Environment(\.presentationMode) var presentationMode
    @State var beSaved = false
    @Binding var item:ItemDetail
    
    var body: some View {
        return VStack(alignment: .leading, spacing: 0) {
            //ScrollView{
            Form{
                Section(header: Text("商品基本情報").font(.title)) {
                    
                    TextField("商品名", text: $item.itemName)
                        .setTextFieldWithLabel("商品名", text:$item.itemName)
                    
                    TextField("商品販売価格", text: $item.itemPrice)
                        .setTextFieldWithLabel("商品販売価格",text: $item.itemPrice)
                    
                    CommentInputView(text: $item.itemDescr)
                        .frame(height:100)
                        .setTextFieldWithLabel("商品説明",text: $item.itemDescr)
                    
                    TextField("商品代表写真URL", text: $item.itemMainPicUrl)
                        .setTextFieldWithLabel("商品代表写真URL",text: $item.itemMainPicUrl)
                    
                    MBWebImageView(imagUrl: self.item.itemMainPicUrl)
                }
                //   }
            }
             if item.id == nil {
            HStack{
                Spacer()
                
               
                    Button(action: save) {
                        Text("Save").setStyleToLikeButton(width: 0.5)
                    }
                
                Spacer()
            }.padding(.top)
            Spacer()
                }
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }.onAppear(){
            
        }
        
        
    }
    
    func save() {
        if item.id == nil {
            self.model.items.append(item)
        } else {
            for i in 0..<self.model.items.count {
                if self.model.items[i].id == item.id {
                    self.model.items[i] = item
                    break
                }
            }
        }
        
        APIHelper.saveShopItemInfo(items: self.model.items, whenOK: {
            DispatchQueue.main.async{
//                self.presentationMode.wrappedValue.dismiss()
//                return
                self.beSaved.toggle()
            }
        }, whenNG: {
            // TODO
        }, whenTokenNG: {beGotoLogin,msg in
            if beGotoLogin {
                DispatchQueue.main.async{
                    model.beGotoLogin.toggle()
                }
            }
        })
        
    }
    
    func delete() {
        for i in 0..<self.model.items.count {
            if self.model.items[i].id == item.id {
                self.model.items.remove(at: i)
                break
            }
            
        }
        
        APIHelper.saveShopItemInfo(items: model.items, whenOK: {
                        DispatchQueue.main.async{
                            self.presentationMode.wrappedValue.dismiss()
                            return
                        }
        }, whenNG: {
            // TODO
        }, whenTokenNG: {beGotoLogin,msg in
            if beGotoLogin {
                DispatchQueue.main.async{
                    model.beGotoLogin.toggle()
                }
            }
        })
//        APIHelper.saveShopItemInfo(model: model, whenOK: {
//            DispatchQueue.main.async{
//                self.presentationMode.wrappedValue.dismiss()
//                return
//            }
//        }) {
//            DispatchQueue.main.async{
//                return
//            }
//        }
    }
}

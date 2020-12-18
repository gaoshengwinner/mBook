//
//  MyItemEditView.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/06.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct MyItemEditTabView: View {
    @EnvironmentObject var model: Model
    @State var itemIndex:Int
    @Environment(\.presentationMode) var presentationMode
    @State var beSaved = false
    var body: some View {
        TabView{
            MyAddItemView(item:self.$model.items[self.itemIndex])
                .tabItem {
                    Image(systemName: "square.and.pencil")
                        .font(.largeTitle)
            }
            MyItemPreviewView(item: self.$model.items[self.itemIndex])
                .tabItem {
                    Image(systemName: "eyeglasses")
                        .font(.largeTitle)
            }
        }.navigationBarItems(trailing:
            Button(action: save, label: {
                Image(systemName: "checkmark.rectangle").font(.largeTitle).foregroundColor(.blue)
            })
                .alert(isPresented: $beSaved)
                {Alert(title: Text("商品情報"),
                       message: Text("商品更新しました。"),
                       dismissButton: .default(Text("OK"), action: {
                        
                        self.presentationMode.wrappedValue.dismiss()
                       }))
            }
            
        )
    }
    
    func save() {
//        if self.model.items[self.itemIndex].itemDetail.id == nil {
//            self.model.items.append(itemlDispDetail.itemDetail)
//        } else {
//            for i in 0..<self.model.items.count {
//                if self.model.items[i].itemDetail.id == itemlDispDetail.itemDetail.id {
//                    self.model.items[i] = itemlDispDetail.itemDetail
//                    break
//                }
//            }
//        }
        APIHelper.saveShopItemInfoRow( item:self.model.items[self.itemIndex], whenOK: {
            DispatchQueue.main.async{
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
    
}


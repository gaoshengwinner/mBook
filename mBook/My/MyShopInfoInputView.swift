//
//  MyShopInfoInputView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/25.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct MyShopInfoInputView: View {
    @EnvironmentObject var model: Model
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let paddingVale = CGFloat(20)
    let lineHeight = CGFloat(30)
    @State var shopInfo = ShopInfo()
    @State var errShopName = ""
    @State var errShopTel = ""
    @State var errShopAddr = ""
    @State var errShopPicUrl = ""
    
    @State var beSaved = false
    
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
            VStack(spacing:0){
                Group{
                    Group{
                        
                        TextField("店舗名", text: $shopInfo.shopName)
                            .createInutText(errorValue: self.errShopName)
                        
                        TextField("TEL", text: $shopInfo.shopTel).keyboardType(.phonePad)
                        .createInutText(errorValue: self.errShopTel)
                        
                        TextField("店舗住所", text: $shopInfo.shopAddr)
                        .createInutText(errorValue: self.errShopAddr)
                        
                        TextField("店舗代表写真URL", text: $shopInfo.shopPicUrl)
                        .keyboardType(.asciiCapable)
                        .createInutText(errorValue: self.errShopPicUrl)
                        
                    }
                    Group{
                      
                        HStack{
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Cancel").setStyleToLikeButton(width: 0.4)
                            }
                            Button(action: save) {
                                
                                Text("Save").setStyleToLikeButton(width: 0.4)
                            }
                            .alert(isPresented: $beSaved)
                            {Alert(title: Text("店舗情報"),
                                   message: Text("舗情報情報更新しました。"),
                                   dismissButton: .default(Text("OK"), action: {
                                    
                                    //self.presentationMode.wrappedValue.dismiss()
                                   }))
                                
                            }
                        }.padding(.top)
                        if !self.shopInfo.shopPicUrl.isEmpty {
                            MBWebImageView(imagUrl: self.shopInfo.shopPicUrl).padding(.top)
                        }
                    }
                    
                    
                    
                    Spacer()
                }
            }.padding(paddingVale)
                .hideNavigationBar()
                .onAppear(){
                    self.shopInfo = self.model.shopInfo
            }.navigationBarTitle("店舗情報",displayMode: .inline)

        
    }
    
    func save() {
        APIHelper.saveShopInfoForRest(shopInfo: self.shopInfo, whenOK: {
            DispatchQueue.main.async {
                self.model.shopInfo = self.shopInfo
            }
            self.beSaved.toggle()
        }, whenNG:  {result in
            print("\(result!.errs!)")
            for err in result!.errs! {
                print("\(err)")
                if "shopName" == err.errField {
                    self.errShopName = "※" + err.msg!
                }
                if "shopTel" == err.errField {
                    self.errShopTel = "※" + err.msg!
                }
                if "shopAddr" == err.errField {
                    self.errShopAddr = "※" + err.msg!
                }
                if "shopPicUrl" == err.errField {
                    self.errShopPicUrl = "※" + err.msg!
                }
            }
        
        }, whenTokenNG: {beGotoLogin,msg in
            if beGotoLogin {
                DispatchQueue.main.async{
                    model.beGotoLogin.toggle()
                }
            }
        })
        
        
        
    }
}

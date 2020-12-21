//
//  MyShopView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/25.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
import PartialSheet

struct MyShopView: View {
    @EnvironmentObject var model: Model
    @State var loading = true
    @State var shopInfoLoaded = false
    @State var itemInfoLoaded = false
    
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    
                    NavigationLink(destination: MyShopInfoInputView()) {
                        Text("店舗情報")
                            .setStyleToLikeButton()
                        
                    }.padding(.top)
                    
                    
                    NavigationLink(destination: MyItemListView()) {
                        Text("商品情報")
                            .setStyleToLikeButton()
                    }.padding(.top)
                    
                    NavigationLink(destination: Text("gdasfas")) {
                        Text("メニュー情報")
                            .setStyleToLikeButton()
                    }.padding(.top)
                    
                    NavigationLink(destination: ColorManaView().environmentObject(self.model)) {
                        Text("Color管理")
                            .setStyleToLikeButton()
                    }.padding(.top)
                    
                    Spacer()
                    
                }.navigationBarTitle(Text("店舗管理"),displayMode: .inline)
                .navigationBarItems(leading:
                                        HStack{
                                            Image(systemName: "arrow.turn.up.left")
                                        }.foregroundColor(.blue)
                                        .font(.title)
                                        .onTapGesture {
                                            self.model.beGotoMyShop.toggle()
                                        }
                )
            }
        }.onAppear(){
            self.model.initShopInfo {
                self.shopInfoLoaded=true
                self.loading = !(self.shopInfoLoaded && self.itemInfoLoaded)
            }
            self.model.initShopItemInfo {
                self.itemInfoLoaded=true
                self.loading = !(self.shopInfoLoaded && self.itemInfoLoaded)
            }
            self.model.freshManaColorInfoList()
            
            
        }.setLoadingView(isPresented: $loading)
    }
}

////
////  ShopMainView.swift
////  mBook
////
////  Created by 郑月华 on 2020/07/18.
////  Copyright © 2020 Meal Book corp. All rights reserved.
////
//
//import SwiftUI
//
//struct ShopMainView: View {
//    @State var shopInfoResult : ShopInfoResult?
//    @State var selected: Int = 1
//    @State var isLoadOK: Bool = false
//    @State var isError : Bool = false
//    @State var errormsg : String?
//    
//    let shopID: String
//    
//    
//    var body: some View {
//        VStack{
//            if self.isLoadOK {
//                // ページ設定
//                TabView(selection: $selected){
//                    ForEach (0..<self.shopInfoResult!.shopBigPageInfos!.count){ index in
//                        ShopPageCreatorView(shopBigPageInfo:  self.shopInfoResult!.shopBigPageInfos![index], shopHeadInfo: self.shopInfoResult!.shopHeadInfo)
//                            .tabItem({
//                                Image(systemName: self.shopInfoResult!.shopBigPageInfos![index].imageURL!)
//                                    .font(.title)
//                                Text(self.shopInfoResult!.shopBigPageInfos![index].title!)
//                            }).tag(index)
//                        
//                    }
//                }.accentColor(.green) //selected color
//                
//                Spacer()
//            } else if self.isError{
//                Text(self.errormsg!)
//            } else {
//                Text("Loading...")
//            }
//        }.onAppear(perform: {
//            self.getShopInfo(shopID:self.shopID)
//        })
//    }
//    
//    func getShopInfo(shopID:String){
//        
//        APIHelper.getShopInfo(shopID: shopID, ok : { result in
//            self.shopInfoResult = result
//            self.isLoadOK.toggle()
//            
//        } , ng : { error in
//            self.errormsg = error!
//            self.isError.toggle()
//        })
//    }
//    
//    
//}

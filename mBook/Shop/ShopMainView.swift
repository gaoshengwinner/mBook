//
//  ShopMainView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/18.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct ShopMainView: View {
    let shopInfoResult : ShopInfoResult?
    @State var selected: Int = 1
    
    init(shopInfoResult : ShopInfoResult) {
        self.shopInfoResult = shopInfoResult
        UITabBar.appearance().backgroundColor = .blue
    }

    var body: some View {
        VStack{
            
            // 共通ヘッド
            ShopHeadView(shopHeadInfo: self.shopInfoResult!.shopHeadInfo!)
            
            // ページ設定
            TabView(selection: $selected){
                ForEach (0..<self.shopInfoResult!.shopBigPageInfos!.count){ index in
                    MenuView().tabItem({
                        Image(systemName: self.shopInfoResult!.shopBigPageInfos![index].imageURL)
                            .font(.title)
                        Text(self.shopInfoResult!.shopBigPageInfos![index].title)
                    }).tag(index)
                }
            }.accentColor(.green) //selected color
            
            Spacer()
        }
    }
}


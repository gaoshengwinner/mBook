//
//  ShopHeadView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/18.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ShopHeadView: View {
    let height : CGFloat
    
    var shopHeadInfo :ShopHeadInfo
    init(shopHeadInfo : ShopHeadInfo) {
        self.shopHeadInfo = shopHeadInfo
        self.height = CGFloat(UIScreen.main.bounds.width * shopHeadInfo.heightScale)
    }
    
    var body: some View {
        VStack{
            
            HStack{
                Spacer()
                if !self.shopHeadInfo.imegUrl.isEmpty {
                    WebImage(url: URL(string: self.shopHeadInfo.imegUrl))
                        .placeholder(content: {
                            Color.gray
                        })
                        .resizable()
                        .scaledToFill()
                        .frame(maxHeight: height)
                        .clipped()
                }
                else if !self.shopHeadInfo.text.isEmpty {
                    Text(self.shopHeadInfo.text)
                        .frame(height: 40)
                        .font(.largeTitle)
//                    .background(Color.gray.opacity(0.1))
//                        .foregroundColor(
//                            self.shopHeadInfo.textForegroundColor.isEmpty ? nil :
//                                Color(MBUIColor.Color(color: ColorEnum(rawValue: self.shopHeadInfo.textForegroundColor)!)))
                    
                }
                Spacer()
            }
        }
        //.background(self.shopHeadInfo.backgroundColor.isEmpty ? nil : Color(MBUIColor.Color(color: ColorEnum(rawValue: self.shopHeadInfo.backgroundColor)!)))
        .frame(height: 40)
        
    }
}

struct ShopHeadView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

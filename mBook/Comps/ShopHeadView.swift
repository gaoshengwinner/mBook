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
    let height : CGFloat = 50
    
    var shopHeadInfo :ShopHeadInfo
    init(shopHeadInfo : ShopHeadInfo) {
        self.shopHeadInfo = shopHeadInfo
        
        if !self.shopHeadInfo.backgroundColor!.isEmpty {
        UINavigationBar.appearance().backgroundColor = MBUIColor.getUIColor(color: self.shopHeadInfo.backgroundColor)
        }
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        let barAppearance =  UINavigationBarAppearance()
                           barAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]

        UINavigationBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack{
            HStack{
                if !self.shopHeadInfo.imegUrl!.isEmpty {
                    WebImage(url: URL(string: self.shopHeadInfo.imegUrl!))
                        .placeholder(content: {
                            Color.gray
                        })
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(maxHeight: 50)
                    .clipped()
                }
                else if !self.shopHeadInfo.text!.isEmpty {
                    Text(self.shopHeadInfo.text!)
                        .font(.largeTitle)
                        .foregroundColor(Color(MBUIColor.getUIColor(color: self.shopHeadInfo.textForegroundColor)))
                    //.frame(width: UIScreen.main.bounds.width)
                        
                }
                Spacer()
            }
        }
        
    }
}

struct ShopHeadView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

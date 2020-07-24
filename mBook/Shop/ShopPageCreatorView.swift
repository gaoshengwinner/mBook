//
//  ShopPageCreatorView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/19.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct ShopPageCreatorView: View {
    @EnvironmentObject var model: Model
    let shopBigPageInfo : ShopBigPageInfo?
    let shopHeadInfo: ShopHeadInfo?
    @State var isGOTOBack:Bool = false
    
    @State private var isActive: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    init(shopBigPageInfo : ShopBigPageInfo?,shopHeadInfo: ShopHeadInfo?) {
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]

        UINavigationBar.appearance().isHidden = true
        
        
        self.shopBigPageInfo = shopBigPageInfo
        self.shopHeadInfo  = shopHeadInfo
    }
    var body: some View {
        //        VStack{
        //            NavigationView{
        //            ShopHeadView(shopHeadInfo: self.shopInfoResult!.shopHeadInfo!)
        //            ScrollView{
        //            VStack(spacing:5) {
        //                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //                Spacer()
        //                }
        //            }
        //            }
        HStack{
            
            NavigationView{
                ShopPageDetailView(shopBigPageInfo: shopBigPageInfo)
                    .navigationBarTitle(
                        Text(shopHeadInfo!.text!)
                            .font(.largeTitle)
                            .foregroundColor(Color(MBUIColor.getUIColor(color: self.shopHeadInfo!.textForegroundColor)))
                        , displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        self.model.beGobacktoMain = true
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.left").font(.largeTitle).foregroundColor(.blue)
                        }//, trailing: ShopHeadView(shopHeadInfo: self.shopHeadInfo!)
                )
                
                
                
            }.background(Color.red)
            
            
            
            
        }
    }
}


struct ShopPageDetailView: View {
    let shopBigPageInfo : ShopBigPageInfo?
    var body: some View {
        VStack{
            if shopBigPageInfo == nil || self.shopBigPageInfo!.contents == nil {Text("error")}
            else {
                ScrollView{
                    ForEach (0..<self.shopBigPageInfo!.contents!.count){ index in
                        
                        if self.shopBigPageInfo!.contents![index].contentType == "1" {
                            MBText(text:
                                self.shopBigPageInfo!.contents![index].contentProperty![PCPT_TEXT]!,
                                   fontWeight: self.shopBigPageInfo!.contents![index].contentProperty![PCPT_FONT_WEIGHT],
                                   foregroundColor:
                                self.shopBigPageInfo!.contents![index].contentProperty![PCPT_FOREGROUND_COLOR],
                                   backgroundColor:
                                self.shopBigPageInfo!.contents![index].contentProperty![PCPT_BACKGROUND_COLOR],
                                   font: self.shopBigPageInfo!.contents![index].contentProperty![PCPT_FONT])
                        }
                    }
                }
                
            }
            
            Spacer()
        }
    }
}

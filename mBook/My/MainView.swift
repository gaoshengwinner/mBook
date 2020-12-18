//
//  MainView.swift
//  mBook
//
//  Created by 郑月华 on 2020/06/26.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
import PartialSheet

struct MainView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        VStack{
            if Token.getRefreshToken() == nil || self.model.beGotoLogin  {
                LoginView()
            }else{
                Group{
                    if self.model.beGotoMyShop {
                        MyShopView()
                    } else {
                        Text("GOTO MY Shop").setStyleToLikeButton().onTapGesture {
                            self.model.beGotoMyShop.toggle()
                        }
                        Text("GOTO MY Login").setStyleToLikeButton().onTapGesture {
                            self.model.beGotoLogin.toggle()
                        }
                    }
                    
                }
            }
        }
    }
    
    
    
}


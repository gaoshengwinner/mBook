//
//  MainView.swift
//  mBook
//
//  Created by 郑月华 on 2020/06/26.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var isLogout = false
    var body: some View {
        VStack{
            if self.isLogout {
                LoginView()
            } else {
                VStack{
                    Button(action: {
                        Token.deleteToken()
                        self.isLogout.toggle()
                    })
                    {
                        Text("Logout")
                    }
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

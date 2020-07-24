//
//  FindPSWView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/03.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct FindPSWView: View {
    let lineHeight = CGFloat(30)
    let paddingVale = CGFloat(20)
    @State var isGotoLogin = false
    
    @State var username = ""
    var body: some View {
        VStack {
            if self.isGotoLogin {
                LoginView()
            } else {
                self.findPSWView
            }
        }
        
    }
    var findPSWView: some View {
        VStack{
            HStack{
                Button(action: {
                    self.isGotoLogin.toggle()
                }, label: {
                    
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                    Spacer()
                    }
                )
            }.padding(paddingVale)
            VStack{
                Text("ご登録した時に使用したメールアドレスを入力してください。").foregroundColor(.blue)
                VStack(spacing:0){
                    TextField("メールアドレス", text: $username)
                        .frame(height: lineHeight)
                        .keyboardType(UIKeyboardType.asciiCapable)
                    Rectangle()
                        .frame(height: 1.0, alignment: .bottom)
                        .foregroundColor(Color.blue)
                }
                
                Button(action: {
                    
                }) {
                    Text("送信")
                        .frame(width: UIScreen.main.bounds.width-paddingVale)
                        .frame(height: lineHeight)
                }
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(lineHeight/2)
                
                Spacer()
                
            }.padding(.top, 100).padding(paddingVale)
            Spacer()
        }
    }
}

struct FindPSWView_Previews: PreviewProvider {
    static var previews: some View {
        FindPSWView()
    }
}

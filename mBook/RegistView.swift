//
//  RegistView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/03.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct RegistView: View {
    let lineHeight = CGFloat(30)
    let paddingVale = CGFloat(20)
    @State var username: String = ""
    @State var password: String = ""
    @State var passwordCof: String = ""
    @State var isNotCanRegeist = true
    @State var conMailcode: String = ""
    @State var errmsMeil:String = ""
    @State var errmsPSW:String = ""
    @State var errmsCode:String = ""
    
    @State var isGotoLogin = false
    @State var isConfirmMail = false
    @State var isRegistIsOK = false;
    
    var body: some View {
        VStack {
            if self.isGotoLogin {
                LoginView()
            } else {
                VStack{
                    Button(action: {
                        self.isGotoLogin.toggle()
                    }, label: {
                        
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        Spacer()
                        }
                    ).padding(paddingVale)
                    
                    if self.isConfirmMail {
                        self.conMailView
                    } else {
                        
                        self.registView
                    }
                }
            }
        }
    }
    
    var conMailView : some View {
        
        VStack {
            VStack{
                Text("すでにご入力したメールアドレスに送信したコードを入力してください。").foregroundColor(.blue)
                VStack(spacing:0){
                    TextField("コード", text: Binding(
                        get:{
                            return self.conMailcode
                    },
                        set:{(newValue) in
                            if newValue != "" {
                                self.isNotCanRegeist = false
                            }
                            return self.conMailcode = newValue
                            
                    }
                    ))
                        .frame(height: lineHeight)
                        .keyboardType(UIKeyboardType.asciiCapable)
                    Rectangle()
                        .frame(height: 1.0, alignment: .bottom)
                        .foregroundColor(Color.blue)
                    HStack{
                        Text(self.errmsCode).foregroundColor(.red)
                        Spacer()
                    }
                }
                HStack{
                    Button(action: {
                        let deviceId = DeviceHelper.getDeviceId()
                        print(deviceId)
                        APIHelper.postRegistOK(code: self.conMailcode,whenOK:{
                            self.isGotoLogin = true
                        },whenNG: {result in
                            if result == nil {
                                self.errmsCode = "※予想外エラー"
                            } else {
                                for err in result!.errs! {
                                    self.errmsCode = "※" + err.msg!
                                }
                            }
                        })
                        
                    }) {
                        Text("登録")
                            .frame(width: UIScreen.main.bounds.width-paddingVale)
                            .frame(height: lineHeight)
                    }
                    .alert(isPresented: $isRegistIsOK){
                        Alert(title: Text("登録"),
                              message: Text("mBookに登録しました、ログインしてください。"),
                              dismissButton: .default(Text("OK"), action: {
                                self.isGotoLogin = true
                                
                              }))
                    }
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(lineHeight/2)
                    .disabled(self.isNotCanRegeist)
                }
                Spacer()
               
            }.padding(paddingVale)
        }.padding(.top, 70)
    }
    
    var registView : some View {
        VStack {
            VStack{
                
                VStack{
                    Text("mBookに登録").foregroundColor(.blue)
                    
                }
                VStack(spacing:0){
                    TextField("メールアドレス", text: $username)
                        .frame(height: lineHeight)
                        .keyboardType(UIKeyboardType.asciiCapable)
                    Rectangle()
                        .frame(height: 1.0, alignment: .bottom)
                        .foregroundColor(Color.blue)
                    HStack{
                        Text(self.errmsMeil).foregroundColor(.red)
                        Spacer()
                    }
                    //Text("ログイン時や、パスワードをリセットする場合に、このメールを使用します。")
                    //    .fontWeight(.thin)
                }
                VStack(spacing:0){
                    SecureField("パスワード", text: $password)
                        .frame(height: lineHeight)
                    Rectangle()
                        .frame(height: 1.0, alignment: .bottom)
                        .foregroundColor(Color.blue)
                    HStack{
                        Text(self.errmsPSW).foregroundColor(.red)
                        Spacer()
                    }
                    //Text("半角英数字もしくは記号を２つ以上含む８〜２０文字")
                    //    .fontWeight(.thin)
                }
                
                
                VStack(spacing:0){
                    Button(action: {
                        let deviceId = DeviceHelper.getDeviceId()
                        print(deviceId)
                        APIHelper.postRegist(username: self.username, password: self.password,whenOK: {
                            self.errmsMeil = ""
                            self.errmsPSW = ""
                            self.isConfirmMail = true
                            
                        },whenNG: {result in
                            self.errmsMeil = ""
                            self.errmsPSW = ""
                            if result == nil {
                                self.errmsMeil = "※ 予想外異常"
                            } else {
                                for err in result!.errs! {
                                    if APIResult.ERR_FIELD_MAIL == err.errField {
                                        self.errmsMeil = "※" + err.msg!
                                    }
                                    
                                    if APIResult.ERR_FIELD_PSW == err.errField {
                                        self.errmsPSW = "※" + err.msg!
                                    }
                                }
                            }
                            
                            
                            
                        })
                        
                    }) {
                        Text("次へ")
                            .frame(width: UIScreen.main.bounds.width-paddingVale)
                            .frame(height: lineHeight)
                    }
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                        
                    .cornerRadius(lineHeight/2)
                    .disabled(self.username.count == 0 || self.password.count == 0 )
                    
                }
                .padding(.top, 10.0)
                
                Spacer()
                
                
            }.padding(paddingVale)
        }
        .padding(.top, 70)
    }
}

struct RegistView_Previews: PreviewProvider {
    static var previews: some View {
        RegistView()
    }
}

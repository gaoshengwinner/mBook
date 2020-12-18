//
//  LoginView.swift
//  mBook
//
//  Created by 郑月华 on 2020/06/22.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var model: Model
    let loginheaderImage = "loginheader.jpg"
    let mBQrcodeImage = "mb_qr.jpg"
    let paddingVale = CGFloat(20)
    let lineHeight = CGFloat(30)
    @State var username: String = ""
    @State var password: String = ""
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = ""
    @State var isCanGotoMain = false
    @State var isGotoRegist = false
    @State var isFindPSW = false
    @State var errmsMeil:String = ""
    @State var errmsPSW:String = ""
    
    
    var body: some View {
        VStack {
            if self.isFindPSW {
                FindPSWView()
            }
            else if self.isGotoRegist{
                RegistView()
            }
            else if self.isCanGotoMain {
                
                MainView()
            }else{
                self.loginView
                
            }
        }
    }
    var loginView : some View {
        
        VStack(spacing:5){
            Image(uiImage: UIImage(named: loginheaderImage)! )
                .resizable()
                .scaledToFit()
            VStack(spacing:20){
                TextField("メールアドレス", text: $username)
                    .keyboardType(UIKeyboardType.asciiCapable)
                .createInutText(errorValue: self.errmsMeil)
                
                SecureField("パスワード", text: $password)
                               .createInutText(errorValue: self.errmsPSW)
                
                VStack(spacing:0){
                    Button(action: {
                        APIHelper.login(memberEmail: self.username, memberPassword: self.password,whenOK:{loginResult in
                            Token.createTokenKeyChain(lr: loginResult)
                            self.isCanGotoMain.toggle()
                            DispatchQueue.main.async {
                                self.model.beGotoLogin = false
                            }
                        },whenNG:{loginResult in
                            if loginResult == nil ||  loginResult!.errs == nil{
                                self.errmsMeil = "※未知例外発生しました。"
                            } else {
                                for err in loginResult!.errs! {
                                    if LoginResult.ERR_FIELD_MAIL == err.errField {
                                        self.errmsMeil = "※" + err.msg!
                                    }
                                    
                                    if LoginResult.ERR_FIELD_PSW == err.errField {
                                        self.errmsPSW = "※" + err.msg!
                                    }
                                }
                            }
                        })
                    }) {
                        Text("ログイン")
                            .frame(width: UIScreen.main.bounds.width-paddingVale)
                            .frame(height: lineHeight)
                    }
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(lineHeight/2)
                    .disabled(self.username.count == 0 || self.password.count == 0 )
                    
                    Button(action: {
                        self.isFindPSW = true
                        
                    }) {
                        Text("パスワードを忘れた場合").foregroundColor(.blue).padding(.top, 10.0)
                    }
                }
                VStack(spacing:0){
                    Text("mBook Qr Codeをスキャンして注文")
                    Image(uiImage: UIImage(named: mBQrcodeImage)! )
                        .resizable()
                        .scaledToFit()
                    
                    Button(action: {
                        print("Scan tapped!")
                        self.isPresentingScanner = true
                    }) {
                        HStack{
                            Image(systemName: "camera")
                            Text("Scan")}
                            .frame(height: lineHeight)
                            .frame(width: UIScreen.main.bounds.width/3)
                            .foregroundColor(.blue)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.blue, lineWidth: 3)
                                    .frame(height: lineHeight)
                                    .frame(width: UIScreen.main.bounds.width/3)
                        )
                    }
                    .sheet(isPresented: $isPresentingScanner){
                        self.scannerSheet
                    }
                    Text(scannedCode)
                }
                
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        self.isGotoRegist = true
                    }) {
                        Text("新しいアカウントを作成＞＞")
                            .foregroundColor(.blue)
                            
                            .frame(height: lineHeight)
                    }
                        //.background(Color.blue.opacity(0.5))
                        .foregroundColor(Color.blue)
                }
            }.padding(paddingVale)
            
        }.edgesIgnoringSafeArea(.top)
    }
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code
                    self.isPresentingScanner = false
                    self.isCanGotoMain = true
                    
                }
        }
        )
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

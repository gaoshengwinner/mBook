//
//  Token.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/24.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct Token : Codable{
    var refreshToken:String?
    var refreshTokenLimit:CLong?
    var refressBeginDate:Date
    var accessToken:String?
    var accessTokenLimit:CLong?
    var accessTokenDate:Date
    
    static func createTokenKeyChain(lr:LoginResult)->Void{
        let currentDate = NSDate() as Date
        
        let data = try! JSONEncoder().encode(Token(
            refreshToken:lr.refreshToken ?? "",
            refreshTokenLimit:lr.refreshTokenLimit ?? 0,
            refressBeginDate:currentDate,
            accessToken:lr.accessToken ?? "",
            accessTokenLimit:lr.accessTokenLimit ?? 0,
            accessTokenDate:currentDate
            ))
        _ = Keychain.save(key: Constants.KEY_CHAIN_TOKEN, data: data)
    }
    
    static func refreshAccessToken(refreshTokenResult:RefreshTokenResult?) -> Void{
        if refreshTokenResult == nil {
            return
        }
        let currentDate = NSDate() as Date
        let data = Keychain.load(key: Constants.KEY_CHAIN_TOKEN)
        if data == nil {
            return
        }
        var token = try! JSONDecoder().decode(Token.self, from: data!)
        
        token.accessToken = refreshTokenResult!.accessToken
        token.accessTokenLimit = refreshTokenResult!.accessTokenLimit
        token.accessTokenDate = currentDate
        
        let tokedata = try! JSONEncoder().encode(token)
        _ = Keychain.save(key: Constants.KEY_CHAIN_TOKEN, data: tokedata)
        
    }
    
    
//    static func updateAccessToken(){
//
//    }
    
    static func getRefreshToken()->String?{
        let currentDate = NSDate() as Date
        let data = Keychain.load(key: Constants.KEY_CHAIN_TOKEN)
        if data == nil {
            return nil
        }
        let token = try! JSONDecoder().decode(Token.self, from: data!)

        let limtDate = token.refressBeginDate.addingTimeInterval(TimeInterval(token.refreshTokenLimit!-60))
        print("\(limtDate)")
        print("\(currentDate)")
        return limtDate < currentDate
        ? nil :token.refreshToken
    }
    
    static func getAccessToken()->String?{
        let currentDateTime = Date()
        let data = Keychain.load(key: Constants.KEY_CHAIN_TOKEN)
        if data == nil {
            return nil
        }
        let token = try! JSONDecoder().decode(Token.self, from: data!)

        let pashMinus = Int(currentDateTime.timeIntervalSince(token.accessTokenDate))
        print("statusCode: \(String(describing: Int(token.accessTokenLimit!)))")
        return pashMinus < Int(token.accessTokenLimit!)
        ?  token.accessToken :nil
    }
    
    static func deleteToken()->Void{
        _ = Keychain.delete(key: Constants.KEY_CHAIN_TOKEN)
    }
}

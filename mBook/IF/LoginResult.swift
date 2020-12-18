//
//  LoginResult.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/24.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct LoginResult : Codable {
    static let ERR_FIELD_MAIL = "memberEmail"
    static let ERR_FIELD_PSW = "memberPassword"
    var statu:String?
    var errs : Array<Errs>?
    
    var refreshToken:String?
    var refreshTokenLimit:CLong?
    var accessToken:String?
    var accessTokenLimit:CLong?
    
    static func getLoginResult(data:Data) -> LoginResult?{
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do{
            return try decoder.decode(LoginResult.self, from:data)
        }catch{
            print("\(error)")
            return  nil
        }
        
    }
    
}


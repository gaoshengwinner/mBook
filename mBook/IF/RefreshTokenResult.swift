//
//  RefreshTokenResult.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/27.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct RefreshTokenResult: Codable {
    var statu:String?
    var err:String?
    var accessToken:String?
    var accessTokenLimit:CLong?
    
    static func getRefreshTokenResult(data:Data) -> RefreshTokenResult?{
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do{
            return try decoder.decode(RefreshTokenResult.self, from:data)
        }catch{
            print("\(error)")
            return  nil
        }
        
    }
}

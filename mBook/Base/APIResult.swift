//
//  APIResult.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/04.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct APIResult: Codable {
    static let IS_OK:String = "0"
    static let ERR_FIELD_MAIL = "memberEmail"
    static let ERR_FIELD_PSW = "memberPassword"
    
    var statu:String = ""
    var errs = Array<Errs>()
    
    static func getAPIResult(data:Data) -> APIResult{
        let decoder = JSONDecoder()
        do{
            return try decoder.decode(APIResult.self, from:data)
        }catch{
            return APIResult()
        }
        
    }
}

struct Errs : Codable{
    var msg:String=""
    var errField:String=""
}

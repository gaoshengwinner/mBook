//
//  ApiResultCommon.swift
//  mBook
//
//  Created by 郑月华 on 2020/12/19.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct ApiResultCommon<Element: Codable> :Codable {

    
    var statu:String?
    var result:[Element]?
    var errs:[Errs]?
    
    func getApiResultCommon(data:Data) -> ApiResultCommon<Element>{
        let decoder = JSONDecoder()
        do{
            return try decoder.decode(ApiResultCommon<Element>.self, from:data)
        }catch{
            print("\(error)")
            return ApiResultCommon<Element>()
        }
        
    }

}


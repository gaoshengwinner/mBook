//
//  ShopInfoRestResult.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/27.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct ShopInfo:  Codable {
    var shopName :String = ""
    
    var  shopAddr:String = ""
    
    var  shopTel:String = ""
    
    var  shopPicUrl:String = ""
    
    static func getShopInfo(data:Data) -> ShopInfo?{
        let decoder = JSONDecoder()
        do{
            return try decoder.decode(ShopInfo.self, from:data)
        }catch{
            print(error)
            return nil
        }
    }
}

//
//  ShopInfoResult.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/18.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct ShopInfoResult: Codable {
    var shopHeadInfo: ShopHeadInfo?
    
    var shopBigPageInfos : [ShopBigPageInfo]?
    
    static func getShopInfoResult(data:Data) -> ShopInfoResult?{
        let decoder = JSONDecoder()
        do{
            return try decoder.decode(ShopInfoResult.self, from:data)
        }catch{
            return nil
        }
    }
}


struct ShopHeadInfo: Codable {
    var heightScale: CGFloat
    
    var imegUrl:String
    
    var text:String
    
    var backgroundColor:String
    
    var textForegroundColor:String
}

struct ShopBigPageInfo: Codable , Identifiable{
    
    var id : Int
    
    var title : String
    
    var imageURL : String
    
    var bottomColor :String
}

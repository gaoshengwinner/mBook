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
            print(error)
            return nil
        }
    }
}


struct ShopHeadInfo: Codable {
    
    var imegUrl:String?
    
    var text:String?
    
    var backgroundColor:String?
    
    var textForegroundColor:String?
}

struct ShopBigPageInfo: Codable , Identifiable{
    
    var id : Int?
    
    var title : String?
    
    var imageURL : String?
    
    var bottomColor :String?
    
    var contents: [PageContents]?
    
}
public let PCPT_TEXT:String = "text"
public let PCPT_FONT_WEIGHT = "font.weight"
public let PCPT_FONT = "font"
public let PCPT_FOREGROUND_COLOR = "foregroundColor"
public let PCPT_BACKGROUND_COLOR = "backgroundColor"

struct PageContents: Codable , Identifiable{
    var id : Int?
    
    var contentType :String?
    
    var contentProperty:[String:String]?

}
//{"shopHeadInfo":{"imegUrl":"https://shinanyaku.com/wp-content/uploads/2018/04/sushiro.png","text":"","backgroundColor":"Green","textForegroundColor":"Yellow"},"shopBigPageInfos":[{"id":0,"title":"Home","imageURL":"house","bottomColor":"Yellow","contents":[{"id":1,"contentType":"1","contentProperty":{"Font.Weight":"light","text":"headline"}},{"id":2,"contentType":"1","contentProperty":{"Font.Weight":"light","text":"footnote"}}]},{"id":3,"title":"Menu","imageURL":"list.dash","bottomColor":"Yellow","contents":null},{"id":4,"title":"Order","imageURL":"square.and.arrow.up","bottomColor":"Yellow","contents":null},{"id":5,"title":"My","imageURL":"person.crop.circle.fill","bottomColor":"Yellow","contents":null}]}

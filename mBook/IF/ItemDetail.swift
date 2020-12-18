//
//  ItemDetail.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/02.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
/*
 {
 MenuCon.ITEM_ALL_PROPERTY_BC_COLOR_VALUE:"255,255,255,1"
 
 }
 */

class ItemDispDetail:Codable{
    var itemAllPropertyInfo:[String:String]?
    
    func setBCColor(color:MBColor){
        if self.itemAllPropertyInfo == nil {
            self.itemAllPropertyInfo = [String:String]()
            
        }
        itemAllPropertyInfo![MenuCon.ITEM_ALL_PROPERTY_BC_COLOR_VALUE] = color.toString()
    }
    
    func setHDetailList(detail:[HDetail]?){
        if self.itemAllPropertyInfo == nil {
            self.itemAllPropertyInfo = [String:String]()
        }
        if detail == nil {
            itemAllPropertyInfo![MenuCon.ITEM_ALL_PROPERTY_DETAIL_VALUE] = ""
        } else {
            let data : Data! = try? JSONSerialization.data(withJSONObject: detail as Any, options: []) as Data?
            itemAllPropertyInfo![MenuCon.ITEM_ALL_PROPERTY_DETAIL_VALUE] = String(data: data, encoding: .utf8)
        }
        
    }
    
    func getItemAllPropertyInfo()->[String:String]{
        _ = getBCColor()
        return self.itemAllPropertyInfo!
    }
    
    func getBCColor()->MBColor{
        // 背景色初期值
        if self.itemAllPropertyInfo == nil {
            self.itemAllPropertyInfo = [String:String]()
        }
        if self.itemAllPropertyInfo![MenuCon.ITEM_ALL_PROPERTY_BC_COLOR_VALUE] == nil || itemAllPropertyInfo![MenuCon.ITEM_ALL_PROPERTY_BC_COLOR_VALUE]!.isEmpty {
            
            itemAllPropertyInfo![MenuCon.ITEM_ALL_PROPERTY_BC_COLOR_VALUE] = MBColor.white().toString()
            
        }
        
        let colorValue = itemAllPropertyInfo![MenuCon.ITEM_ALL_PROPERTY_BC_COLOR_VALUE]!.split(separator: ",")
        
        var mBColor = MBColor()
        mBColor.red = Double(colorValue[0]) ?? 0
        mBColor.green = Double(colorValue[1]) ?? 0
        mBColor.blue = Double(colorValue[2]) ?? 0
        mBColor.opacity = Double(colorValue[3]) ?? 1
        return mBColor
    }
    func getJsonString()->String{
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(self)
        print(String(data: data, encoding: .utf8)!)
        return String(data: data, encoding: .utf8)!
    }
    static func getItemDispDetail(itemDispDetail:String?)->ItemDispDetail{
        if itemDispDetail == nil {
            return ItemDispDetail()
        }
        
        let decoder = JSONDecoder()
        
        do{
            return try decoder.decode(ItemDispDetail.self, from:itemDispDetail!.data(using: .utf8)!)
        }catch{
            print(error)
            return ItemDispDetail()
        }
    }
}
class ItemDetail :Identifiable,Codable{
    var id:Int?
    var itemPrice:String = ""
    var itemName:String = ""
    var itemDescr:String = ""
    var itemMainPicUrl:String = ""
    
    var itemDispDetail:String?
    
    static func getItemDetail(data:Data) -> [ItemDetail]?{
        let decoder = JSONDecoder()
        do{
            return try decoder.decode([ItemDetail].self, from:data)
        }catch{
            print(error)
            return nil
        }
    }
    
}

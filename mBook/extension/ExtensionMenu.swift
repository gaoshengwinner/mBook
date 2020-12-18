//
//  ExtensionMenu.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/06.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

public struct MenuCon {
    // 对齐方式
    public static let ALIGNMENT_KEY = "ALIGNMENT_KEY"
    public static let ALIGNMENT_KEY_V_LEFT = "1"
    public static let ALIGNMENT_KEY_V_MIDDLE = "2"
    public static let ALIGNMENT_KEY_V_RIGHT = "3"
    
    // 商品詳細画面全体属性設定
    public static let ITEM_ALL_PROPERTY = "ITEM_ALL_PROPERTY_"
    public static let ITEM_ALL_PROPERTY_BC_COLOR_VALUE = ITEM_ALL_PROPERTY + "BC_COLOR_VALUE"
    public static let ITEM_ALL_PROPERTY_DETAIL_VALUE = ITEM_ALL_PROPERTY + "DETAIL_VALUE"
    
    
}


public extension View {
    func setMenuImageStyle(widthPre:CGFloat = 1.0) -> some View {
        let width = UIScreen.main.bounds.width * widthPre
        return VStack(spacing:0){
            self.frame(width:width)
                .padding(.bottom)
                .scaledToFit()
            
        }
    }
    
    // 商品詳細画面全体属性設定
    func setItemAllProperty(itemAllPropertyInfo property: [String: String]?)->some View{
        var color:Color?
        if let property = property {
            if let bcColor:String =  property[MenuCon.ITEM_ALL_PROPERTY_BC_COLOR_VALUE]{
                let colorValue = bcColor.split(separator: ",")
                
                var red = Double(colorValue[0]) ?? 1
                if red > 1 {red = red / 255}
                var green = Double(colorValue[1]) ?? 1
                if green > 1 {green = green / 255}
                var blue = Double(colorValue[2]) ?? 1
                if blue > 1 {blue = blue / 255}
                var opacity = Double(colorValue[3]) ?? 1
                if opacity > 1 {opacity = opacity / 100.0}

                color = Color(red:red, green:green, blue:blue, opacity: opacity)
                
            }
        }
        return Group{
            self.background(color)
        }
    }
    
    // 对齐方式
    func setAlignment(property:[String:String]?)->some View{
        var tmpView = self

        if let property = property, let value =  property[MenuCon.ALIGNMENT_KEY] {
            switch value {
            case MenuCon.ALIGNMENT_KEY_V_LEFT:
                tmpView = HStack(spacing:0){
                    self
                    Spacer()
                    } as! Self
            case MenuCon.ALIGNMENT_KEY_V_MIDDLE:
                tmpView = HStack(spacing:0){
                    Spacer()
                    self
                    Spacer()
                    } as! Self
            case MenuCon.ALIGNMENT_KEY_V_RIGHT:
                tmpView = HStack(spacing:0){
                    Spacer()
                    self
                    } as! Self
            default:
                tmpView = self
            }
        } else {
            tmpView = self
        }
        return Group{
            tmpView
        }
        
    }
    
}

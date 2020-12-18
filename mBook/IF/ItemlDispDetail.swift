//
//  ItemlDispDetail.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/25.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI


public struct MBColor:Codable{
    var red:Double = 0
    var green:Double  = 0
    var blue:Double  = 0
    var opacity:Double = 100
    
    mutating func uniteColor(color:Color) ->MBColor{
        self.red = color.red255
        self.green = color.green255
        self.blue = color.blue255
        self.opacity = color.opacity100
        return self
    }
    
    func toColor() ->Color{
        return Color.init(red: red / 255, green: green / 255, blue: blue / 255, opacity: opacity / 100)
    }
    func toString()->String{
        return "\(self.red),\(self.green),\(self.blue),\(self.opacity)"
    }
    
    static func black()->MBColor{
        MBColor(red: 0, green: 0, blue: 0, opacity: 100)
    }
    
    static func white()->MBColor{
        MBColor(red: 255, green: 255, blue: 255, opacity: 100)
    }
    
    static func opacity()->MBColor{
        MBColor(red: 255, green: 255, blue: 255, opacity: 0)
    }
}

enum MBItemDetailType:String {
    case ITEM_NAME = "1001"
    case ITEM_PRICE = "1002"
    case ITEM_DESCR = "1003"
    case ITEM_FREESTRING = "1004"
}

public struct MBItemDetail{
    var id = UUID()
    var isEnable = true
    var type = MBItemDetailType.ITEM_FREESTRING
    var text = ""
    
    func getText(item:ItemDetail?)->String{
        switch type {
        case .ITEM_NAME:
            return item?.itemName ?? ""
        case .ITEM_PRICE:
            return item?.itemPrice ?? ""
        case .ITEM_DESCR:
            return item?.itemDescr ?? ""
        case .ITEM_FREESTRING:
            return text
        }
    }
}

enum HDetailType:String{
    case TEXT = "1001"
    case PHOTO = "1002"
}

// 一行の内容
public struct HDetail{
    var id = UUID()
    var mBItemDetailList = [MBItemDetail]()
    var type = HDetailType.TEXT
    // 1 文字
    var textBackgroudColor = MBColor.opacity()
    var textColor = MBColor.black()
    var textFontSize:CGFloat = 12
    var alignment:String = "1" // 1 Left 2 Center 3 Right
    var padd: CGFloat = 5
    
    // 2 Photo
    var photoNumber:Int = 0
    
    
    func getText(item: ItemDetail?)->String{
        var tmpText = ""
        for mBItemDetail in mBItemDetailList {
            tmpText = tmpText + mBItemDetail.getText(item: item)
        }
        return tmpText;
    }
    
    func getHDetailView(item: ItemDetail?)->some View{
        Group{
            if type == HDetailType.TEXT {
                let s = getText(item: item)
                let ali:Alignment = alignment == "2" ? Alignment.center :
                    alignment == "3" ? Alignment.trailing : Alignment.leading
                
                HStack(alignment:.top,spacing: 0) {
                    Text(s)
                    
                }.padding(.leading,padd)
                .padding(.leading,padd)
                .frame(width:UIScreen.main.bounds.width - padd * 2,alignment:ali)
                .font(Font.system(size: UIFontMetrics.default.scaledValue(for: self.textFontSize)))
                .foregroundColor(textColor.toColor())
                .background(textBackgroudColor.toColor())
            } else if type == HDetailType.PHOTO {
                HStack{
                    if item != nil && item!.itemMainPicUrl != "" {
                    MBWebImageView(imagUrl: item!.itemMainPicUrl)
                    } else {
                        Text("")
                    }
                }
            } else {
                HStack{
                    Text("TODO")
                }
            }
        }
        
    }
}

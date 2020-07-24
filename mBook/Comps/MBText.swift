//
//  MBText.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/19.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct MBText: View {
    let text : String
    let fontWeight:String?
    let foregroundColor:String?
    let backgroundColor:String?
    let font:String?
    var body: some View {
        HStack(spacing: 0){
            Text(text)
                .fontWeight(getFontWeigjtByString(string: fontWeight))
                .foregroundColor(MBUIColor.getColor(color: foregroundColor))
                .font(getFont(string: font))
                .background(MBUIColor.getColor(color: backgroundColor))
            Spacer()
        }
    }
}

public func getFontWeigjtByString(string:String?)->Font.Weight?{
    if string == nil {return nil}
    switch string {
    case "ultraLight":
        return Font.Weight.ultraLight
    case "thin":
        return Font.Weight.thin
    case "light":
        return Font.Weight.light
    case "regular":
        return Font.Weight.regular
    case "medium":
        return Font.Weight.medium
    case "semibold":
        return Font.Weight.semibold
    case "bold":
        return Font.Weight.bold
    case "heavy":
        return Font.Weight.heavy
    case "black":
        return Font.Weight.black
    default:
        return nil
    }
}

public func getFont(string:String?)->Font?{
    if string == nil {return nil}
    switch string {
    case "largeTitle":
        return Font.largeTitle
    case "title":
        return Font.title
    case "headline":
        return Font.headline
    case "subheadline":
        return Font.subheadline
    case "body":
        return Font.body
    case "callout":
        return Font.callout
    case "footnote":
        return Font.footnote
    case "caption":
        return Font.caption
    default:
        return nil
    }
    
}

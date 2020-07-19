//
//  BottomTabResource.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/11.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

enum ViewType {
    case HOME
    case MENU
    case ORDER
    case MBOOK
}

struct BottomTabListResource{
    
    let bottomTabResource : [BottomTabResource]
    
    let bottomColor: UIColor
    init() {
        self.bottomTabResource = BottomTabListResource.getBottomTabResource()
        self.bottomColor = MBUIColor.Color(color: .Yellow)
    }
    
    
    static func getBottomTabResource() -> [BottomTabResource]{
        let result = [BottomTabResource(id: 1, type: "1", imageURL: "house.fill", text: "Home"),
        BottomTabResource(id: 2, type: "3", imageURL: "list.dash", text: "Menu"),
        BottomTabResource(id: 3, type: "3", imageURL: "square.and.arrow.up", text: "Order"),
        BottomTabResource(id: 4, type: "2", imageURL: "person.crop.circle.fill", text: "My"),]
        return result
    }
}

struct BottomTabResource: Identifiable{
    let id :Int
    let type : String
    let imageURL : String
    let text : String
    
    var vieType : ViewType {
        get {
            switch type {
            case "1":
                return ViewType.HOME
            case "2":
                return ViewType.MENU
            case "3":
                return ViewType.ORDER
            default:
                return ViewType.MBOOK
            }
        }
    }
    
}



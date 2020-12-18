//
//  ExtensionColor.swift
//  mBook
//
//  Created by 郑月华 on 2020/12/16.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

public extension Color{

    var red255:Double{
        if #available(iOS 14.0, *) {
            return Double((self.cgColor?.components?[0] ?? 0) * 255)
        } else {
            return 0
        }
    }
    
    var blue255:Double{
        if #available(iOS 14.0, *) {
            return Double((self.cgColor?.components?[2] ?? 0) * 255)
        } else {
            return 0
        }
    }
    
    var green255:Double{
        if #available(iOS 14.0, *) {
            return Double((self.cgColor?.components?[1] ?? 0) * 255)
        } else {
            return 0
        }
    }
    
    var opacity100:Double{
        if #available(iOS 14.0, *) {
            return Double((self.cgColor?.components?[3] ?? 0) * 100)
        } else {
            return 0
        }
    }
    
    
}

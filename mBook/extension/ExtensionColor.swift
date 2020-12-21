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
        return Double((self.cgColor?.components?[0] ?? 0) * 255)
       
    }
    
    var blue255:Double{
        return Double((self.cgColor?.components?[2] ?? 0) * 255)
    }
    
    var green255:Double{
        return Double((self.cgColor?.components?[1] ?? 0) * 255)
    }
    
    var opacity100:Double{
        return Double((self.cgColor?.components?[3] ?? 0) * 100)
    }
    
    var redOld:Double{
        return Double((self.cgColor?.components?[0] ?? 0))
       
    }
    
    var blueOld:Double{
        return Double((self.cgColor?.components?[2] ?? 0))
    }
    
    var greenOld:Double{
        return Double((self.cgColor?.components?[1] ?? 0))
    }
    
    var opacityOld:Double{
        return Double((self.cgColor?.components?[3] ?? 0))
    }
    
    
}

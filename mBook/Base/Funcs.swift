//
//  Funcs.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/04.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct Funcs {
    static func getJson(obj:NSObject) -> String{
        let encode = JSONEncoder();
        let data = try! encode.encode(obj)
        return String(data:data,encoding: .utf8)!
    }
}



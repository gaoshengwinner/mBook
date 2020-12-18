//
//  CMF.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/27.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct CMF{
    static func obToData<T>(_ value: T)->Data where T : Encodable{
        let jsonEncoder = JSONEncoder()
        var data:Data
        do{
            data =  try jsonEncoder.encode(value)
        } catch {
            data="".data(using: String.Encoding.utf8)!
        }
        return data
    }
}

//
//  DeviceInfo.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/04.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct DeviceInfo: Codable {
    var deviceId : String?
    var phoneName: String?
    var appVersion: String?
    var systemName: String?
    var systemVersion: String?
    var deviceIP:String?
    
    func getJson() -> String{
        let encode = JSONEncoder();
        let data = try! encode.encode(self)
        return String(data:data,encoding: .utf8)!
    }
 
}


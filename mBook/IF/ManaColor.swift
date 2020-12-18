//
//  ManaColor.swift
//  mBook
//
//  Created by 郑月华 on 2020/12/18.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct ManaColor :Identifiable, Codable{
    var tempId:Int? = nil
    var id:Int? = nil
    var name:String=""
    var mbColor:MBColor = MBColor.black()
    var isUse = true
    
    static func getManaColor(data:Data) -> [ManaColor]?{
        let decoder = JSONDecoder()
        do{
            return try decoder.decode([ManaColor].self, from:data)
        }catch{
            print(error)
            return nil
        }
    }
}

class ManaColorLisnter : ObservableObject{
    @Published var manaColorList = [ManaColor]()
   // @Environment var model: Model
    init(){
        APIHelper.getManaColorInfoList(whenOK: {(result) in
            DispatchQueue.main.async{
                self.manaColorList = result ?? [ManaColor]()
            }
        }, whenNG: {_ in
            // TODO
        }, whenTokenNG: {_,_ in
            // TODO
        })
        
    }
    
}

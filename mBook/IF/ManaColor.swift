//
//  ManaColor.swift
//  mBook
//
//  Created by 郑月华 on 2020/12/18.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

public struct ManaColor :Identifiable, Codable, Equatable{
    public static func == (hs: ManaColor, rhs: ManaColor) -> Bool {
        return hs.tempId == rhs.tempId &&
               hs.id == rhs.id &&
               hs.name == rhs.name &&
               hs.mbColor.red == rhs.mbColor.red &&
               hs.mbColor.green == rhs.mbColor.green &&
               hs.mbColor.blue == rhs.mbColor.blue &&
               hs.mbColor.opacity == rhs.mbColor.opacity &&
               hs.beUse == rhs.beUse
    }
    
    var tempId:Int? = nil
    public var id:Int? = nil
    var name:String=""
    var mbColor:MBColor = MBColor.black()
    var beUse:Bool = true
    
    var beChanged:Bool? = false
    
    
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
//
//class ManaColorLisnter : ObservableObject{
//    @Published var manaColorList = [ManaColor]()
//   // @Environment var model: Model
//    init(){
//        APIHelper.getManaColorInfoList(whenOK: {(result) in
//            DispatchQueue.main.async{
//                self.manaColorList = result ?? [ManaColor]()
//            }
//        }, whenNG: {_ in
//            // TODO
//        }, whenTokenNG: {_,_ in
//            // TODO
//        })
//    }
//    
//    func reFreshData()->Void{
//        APIHelper.getManaColorInfoList(whenOK: {(result) in
//            DispatchQueue.main.async{
//                self.manaColorList = result ?? [ManaColor]()
//            }
//        }, whenNG: {_ in
//            // TODO
//        }, whenTokenNG: {_,_ in
//            // TODO
//        })
//    }
//    
//}

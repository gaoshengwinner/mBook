//
//  Model.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/20.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

public class Model: ObservableObject {
    @Published var beGobacktoMain:Bool = true
    @Published var beGotoLogin:Bool = false
    @Published var beGotoMyShop = false
    
    @Published var items = [ItemDetail]()
    
    @Published var shopInfo = ShopInfo()
    
    @Published var manaColorList = [ManaColor]()
    
    func freshManaColorInfoList()->Void{
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
    
    func initShopInfo(onComplit:@escaping ()->Void){
        APIHelper.getShopInfo(whenOK: {shopInfo in
                        DispatchQueue.main.async{
                            self.shopInfo = shopInfo ?? ShopInfo()
                            onComplit()
                        }
        }, whenNG: {_ in
            // TODO
        }, whenTokenNG: {beGotoLogin,msg in
            if beGotoLogin {
                DispatchQueue.main.async{
                    self.beGotoLogin.toggle()
                }
            }
        })
   
    }
    
    func initShopItemInfo(onComplit:@escaping ()->Void){
        APIHelper.getShopItemInfo(whenOK: {items in
            DispatchQueue.main.async{
                self.items = items ?? [ItemDetail]()
                onComplit()
            }
        }, whenNG: {_,_ in
            // TODO
        }, whenTokenNG: {beGotoLogin,msg in
            if beGotoLogin {
                DispatchQueue.main.async{
                    self.beGotoLogin.toggle()
                }
            }
        })
    }
    
}

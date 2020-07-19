//
//  ContentView.swift
//  mBook
//
//  Created by 郑月华 on 2020/06/22.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var shopInfoResult : ShopInfoResult?
    @State var isLoadOK:Bool = false
    var body: some View {
        //LoginView()
        
        VStack{
            if !self.isLoadOK {
                Button(action: {
                    self.getShopInfo(shopID: "1")
                }){
                    Text("GOTO SHOP...")
                }
                
            } else {
               
                ShopMainView(shopInfoResult: self.shopInfoResult!)
            }
            
        }
    }
    
    
    func getShopInfo(shopID:String){
        APIHelper.getShopInfo(shopID: shopID, ok : { result in
            self.shopInfoResult = result
            self.isLoadOK = true
        } , ng : { error in
            //print("1")
        })
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}

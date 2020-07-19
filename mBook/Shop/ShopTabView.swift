//
//  ShopTabView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/10.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct ShopTabView: View {
    let bottomInfo: [BottomTabResource]
    init() {
        let r = BottomTabListResource()
        UITabBar.appearance().backgroundColor = r.bottomColor
        self.bottomInfo = r.bottomTabResource
        
        
        
    }
    
    @State var selected: Int = 1
    var body: some View {
        
        TabView(selection: $selected){
            ForEach (0..<bottomInfo.count){ index in
                MenuView().tabItem({
                    Image(systemName: self.bottomInfo[index].imageURL)
                            .font(.title)
                    Text(self.bottomInfo[index].text)
                }).tag(index)
            }
        }.accentColor(.green) //selected color
    }
    
}

struct ShopTabView_Previews: PreviewProvider {
    static var previews: some View {
        ShopTabView()
    }
}

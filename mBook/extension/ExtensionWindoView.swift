//
//  ExtensionWindoView.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/22.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

public extension View{
    func setMBFontSizeWithSheet(isPresented:Binding<Bool> ,textFontSize:CGFloat, onSelect:@escaping(_ textFontSize:CGFloat)->Void) -> some View{
        
        self.sheet(isPresented: isPresented) {
            MBFontSizeSelectorView(textFontSize: textFontSize, onSelect: onSelect)
        }
    }
    func setMBColorWithSheet(isPresented:Binding<Bool> ,
                             model:Model,
                             manaColor:Binding<ManaColor>, onSelect:@escaping (_ manaColor: ManaColor)->Void) -> some View {
        
        self
            .sheet(isPresented: isPresented) {
                MBColorSelectorView(manaColor, model.manaColorList, onSelect: { manaColor in
                    onSelect(manaColor)
                })
                    .environmentObject(model)
            }
    }
    
    func setLoadingView(isPresented:Binding<Bool>)-> some View{
        print(isPresented.wrappedValue)
        return ZStack{
            if isPresented.wrappedValue {
                ZStack{
                    VStack{
                        self
                    }
                   // LoadingView()
                }
            } else {
                VStack{
                    self
                }
            }
        }
    }
    
}

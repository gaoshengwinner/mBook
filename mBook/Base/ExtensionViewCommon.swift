//
//  ExtensionViewCommon.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/26.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

extension View {
    func hideNavigationBar() -> some View {
        self
            .navigationBarTitle("", displayMode: .inline)
            //.navigationBarHidden(true)
    }
}

extension View {
    func setStyleToLikeButton(width:CGFloat = 0.6) -> some View {
        self.frame(width:UIScreen.main.bounds.width*width,height: 35)
            .font(.title)
            .overlay(RoundedRectangle(cornerRadius: 35)
                .stroke(Color.blue, lineWidth: 2))
    }
    
    func setStyleToColorButton(width:CGFloat = 0.6, color:MemoMBColor) -> some View {
        self.frame(width:UIScreen.main.bounds.width*width,height: 40)
            .font(.title)
            .overlay(RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.init(red: color.color.red, green: color.color.green, blue: color.color.blue, opacity: color.color.opacity), lineWidth: 12))
    }
    
    func setStyleForManagTitle() -> some View{
        self.font(.title)
    }
}


extension Rectangle {
    func drawOnderLineFromInput()-> some View{
        self
        .frame(height: 1.0, alignment: .bottom)
        .foregroundColor(Color.blue)
    }
    
}


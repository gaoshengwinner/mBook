//
//  MBFontSizeSelectorView.swift
//  mBook
//
//  Created by 郑月华 on 2020/09/10.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI


struct MBFontSizeSelectorView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let MIN_SIZE:CGFloat = 12
    let MAX_SIZE:CGFloat = 80
    @State var textFontSize:CGFloat = 12
    
    var onSelect:(_ textFontSize:CGFloat)->Void
    
    var body: some View {
        Spacer()
        VStack{
            VStack{
            Text("こんにちは")
                .foregroundColor(.black)
                .font(Font.system(size: UIFontMetrics.default.scaledValue(for: self.textFontSize)))
                Text("\(String(format:"size:%.0f",self.textFontSize))")
            }.frame(width:UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height * 0.3, alignment: .leading)
        }
        Spacer()
        HStack{
            Image(systemName: "lessthan.circle")
                .onTapGesture {
                    if (self.textFontSize > MIN_SIZE) {
                    self.textFontSize = self.textFontSize - 1
                    }
                }
            Slider(value: $textFontSize, in: MIN_SIZE...MAX_SIZE, step: 1)
                .frame(width:UIScreen.main.bounds.width*0.7)
            Image(systemName: "greaterthan.circle")
                .onTapGesture {
                    if (self.textFontSize < MAX_SIZE) {
                    self.textFontSize = self.textFontSize + 1
                    }
                }
        }
        HStack(alignment:.center){
            Text("OK").setStyleToLikeButton(width: 0.4)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                    self.onSelect(self.textFontSize)
                }
        }.padding(.top)
    }
}

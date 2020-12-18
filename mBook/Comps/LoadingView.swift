//
//  LoadingView.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/29.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false
     
        var body: some View {
            ZStack {
                Color(.systemGray5)
                    .opacity(0.5)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Circle()
                    .stroke(Color(.systemGray
                    ), lineWidth: 14)
                    .frame(width: 100, height: 100)
     
                Circle()
                    .trim(from: 0, to: 0.2)
                    .stroke(Color.blue, lineWidth: 7)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .onAppear(){
                        self.isLoading = true
                    }
            }.background(Color.red)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

//
//  YoutubeWebView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/18.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct YoutubeWebView: View {
    let url : String
    init(url:String) {
        self.url = url
    }
    var body: some View {
        WebView(request: URLRequest(url: URL(string: self.url)!))
            .frame(height:UIScreen.main.bounds.width*9/16)
        
    }
}

struct YoutubeWebView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeWebView(url: "https://www.youtube.com/embed/uVBbSrK7Z-8")
    }
}

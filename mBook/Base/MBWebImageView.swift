//
//  MBWebImageView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/11.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MBWebImageView: View {
    let url : URL?
    
    init(imagUrl: String) {
        self.url = URL(string:imagUrl)
    }
    var body: some View {
        WebImage(url: self.url)
            .placeholder(content: {
                Color.gray
            })
            .resizable()
            .scaledToFit()
            .clipped()
    }
}

struct MBWebImageView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            VStack{
                HStack{
                    VStack{
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                    }
                    VStack{
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                    }
                    VStack{
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                    }
                    
                }
                HStack{
                    VStack{
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                    }
                    VStack{
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                    }
                    VStack{
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                    }
                    
                }
                HStack{
                    VStack{
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                    }
                    VStack{
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                    }
                    VStack{
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                        MBWebImageView(imagUrl: "https://t1.hddhhn.com/uploads/tu/202007/7/3.jpg")
                    }
                    
                }
            }
        }
    }
}

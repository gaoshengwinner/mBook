//
//  MenuView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/10.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit
import WebKit
struct Result2 {
    var id = UUID()
    var type : String
    var value: String
}

struct MenuView: View {
    @State var datas = [
        Result2(type: "1", value: "https://chukaeki.com/wp-content/uploads/2017/12/%E8%A5%BF%E8%91%9B%E8%A5%BF%E4%B8%AD%E5%9B%BD%E7%89%A9%E7%94%A3%E5%BA%97%E3%81%AE%E6%B0%B8%E7%9B%9B%E3%83%9E%E3%83%BC%E3%83%88.jpg"),
        Result2(type: "2", value: """
  　090-9243-4152 西村経済再生担当大臣：「宴会を大勢の人数で行うことは避けてもらうとか、朝食会場でも近い距離で大勢の人数が同じ場所で換気の悪い所で食事をすることがないように、こういったことを専門家の皆さんからもご意見頂いて徹底していく」
  　西村大臣はGoToトラベルについて、16日夜に開催される政府の分科会で専門家の意見を聞いて国土交通省が判断するとしながらも、感染拡大の防止策を講じて経済・社会活動の両立を図っていきたいと述べました。
"""),
        Result2(type: "1", value: "http://seopic.699pic.com/photo/50046/0205.jpg_wh1200.jpg"),
        Result2(type: "2", value: "牛皿・ねぎ塩豚定食"),
        Result2(type: "2", value: "test"),
        Result2(type: "2", value: """
    这场抗击新冠肺炎疫情的严峻斗争，让你们这届高校毕业生经受了磨练、收获了成长，也使你们切身体会到了‘志不求易者成，事不避难者进’的道理。前进的道路从不会一帆风顺，实现中华民族伟大复兴的中国梦需要一代一代青年矢志奋斗。
"""),
        Result2(type: "1", value: "https://t1.hddhhn.com/uploads/tu/202007/7/4.jpg"),
        Result2(type: "1", value: "https://t1.hddhhn.com/uploads/tu/202007/7/5.jpg"),
    ]
    
    
    var playButton: UIButton!
    var currentTimeButton: UIButton!
    var durationButton: UIButton!
    
    var body: some View {
        VStack(spacing:5) {
//            ShopHeadView(imegUrl: "https://shinanyaku.com/wp-content/uploads/2018/04/sushiro.png", text: "スシロー",
//                         backgroundColor: ColorEnum.Beige.rawValue, textForegroundColor: "Red")
            //            YoutubeWebView(url: "https://www.youtube.com/embed/uVBbSrK7Z-8")
            
            ScrollView{
                VStack(spacing:5) {
                    
                    ForEach(datas, id: \.id) { result in
                        Group{
                            if result.type == "1" {
                                MBWebImageView(imagUrl: result.value)
                            } else {
                                
                                HStack{
                                    Spacer()
                                    Text(result.value)
                                        .fontWeight(.thin)
                                        .bold()
                                    Spacer()
                                }
                            }
                        }
                    }//.padding(20)//.background(Color.red)
                    
                    
                    
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct ExtractedView: View {
    let systemName:String
    init(systemName:String) {
        self.systemName = systemName
    }
    var body: some View {
        Image(systemName: systemName).font(.largeTitle)
    }
}



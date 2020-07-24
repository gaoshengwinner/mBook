////
////  ContentView.swift
////  mBook
////
////  Created by 郑月华 on 2020/06/22.
////  Copyright © 2020 Meal Book corp. All rights reserved.
////
//
//import SwiftUI
//import PartialSheet
//
//struct ContentView: View {
//     @EnvironmentObject var model: Model
//    @EnvironmentObject var partialSheetManager : PartialSheetManager
//    @State private var showingSheet = false
//    @State var shopInfoResult : ShopInfoResult?
//   // @State var isLoadOK:Bool = false
//    @State var id :String = "1"
//    var body: some View {
//        VStack{
//
////            CommentInputView(text: $id)
////                .frame(height: 40)
////                Button(action: {
////                    self.getShopInfo(shopID: self.id)
////                     self.showingSheet.toggle()
////                 }){
////                     Text("GOTO SHOP...")
////                 }.sheet(isPresented: $showingSheet){
////                    if self.isLoadOK {
////                        ShopMainView(shopID: self.id)
////                    }
////                 }
////
//
//
//            if self.model.beGobacktoMain {
//                CommentInputView(text: $id)
//                                .frame(height: 40)
//
//                Button(action: {
//                     self.getShopInfo(shopID: self.id)
//                }){
//                   Text("OK")
//                }
//            } else {
//                ShopMainView(shopID: id)
//
//            }
//
//           HStack {
//                Spacer()
//                Button(action: {
//                    self.partialSheetManager.showPartialSheet({
//                         print("normal sheet dismissed")
//                    }) {
//                         SheetView()
//                        Text("What")
//                    }
//                }, label: {
//                    Text("Display the Partial Shehet")
//                })
//                    .padding()
//                Spacer()
//            }
//
//
//
//        }
//    }
//
//
//    func getShopInfo(shopID:String){
//        APIHelper.getShopInfo(shopID: shopID, ok : { result in
//            self.shopInfoResult = result
//            self.model.beGobacktoMain = false
//
//        } , ng : { error in
//            //print("1")
//        })
//    }
//
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environmentObject(Model())
//    }
//
//}


import SwiftUI
import PartialSheet
import SDWebImageSwiftUI

struct ContentView: View {
    // 1 add (AppDelegate + .environmentObject(sheetManager).environmentObject(Model()))
    @EnvironmentObject var partialSheet : PartialSheetManager
    @EnvironmentObject var partialSheetManager : PartialSheetManager
    @State private var showingSheet = false
    @State var shopInfoResult : ShopInfoResult?
    @State var id :String = "1"
    @EnvironmentObject var model: Model
    @State var isError : Bool = false
    @State var errormsg : String?
    var body: some View {
        VStack {
            
            if self.isError{
                Text(self.errormsg!)
            } else
           
            if self.model.beGobacktoMain {
                CommentInputView(text: $id)
                    .frame(height: 40)

                Button(action: {
                    self.getShopInfo(shopID: self.id)
                }){
                    Text("OK")
                }
                
                Button(action: {
                    //DocFileManager.saveWithFile()
                    DocFileManager.readWithFile()
                    
                }, label: {
                    Text("FileTest")
                })

                VStack(alignment: .center) {
                    Spacer()
                    Button(action: {
                        // 2.add
                        self.partialSheet.showPartialSheet({
                            print("dismissed")
                        }) {
                            ScrollView{
                                Text("Partial Sheet")
                                Text("Partial Sheet")
                                Text("Partial Sheet")
                                Text("Partial Sheet")
                                Text("Partial Sheet")
                            }.frame(height: UIScreen.main.bounds.height * 0.4)
                        }
                    }, label: {
                        Text("Show Partial Sheet")
                    })
                    Spacer()
                }
            } else {
                ShopMainView(shopID: id)

            }



        }
        // 3 add
        .addPartialSheet()


    }


    func getShopInfo(shopID:String){
        APIHelper.getShopInfo(shopID: shopID, ok : { result in
            self.shopInfoResult = result
            self.model.beGobacktoMain = false

            } , ng : { error in
                self.errormsg = error!
                self.isError.toggle()
            })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//import SwiftUI
//
//struct ContentView: View {
//
//    @State var isShown = false
//
//    var body: some View {
//        Button(action: {
//            self.isShown = true
//        }) {
//            Text("Show ActionSheet")
//        }.sheet(isPresented: $isShown, content: {
//            VStack{
//                Text("good")
//            }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
////            ActionSheet(
////                title: Text("Options"),
////                message: Text("Please say OK!¥nbaybay"),
////                buttons: [.default(Text("OK")),
////                          .destructive(Text("NG")),
////                          .cancel(Text("取り消し"))]
////            )
//        })
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//
//  MyItemPreViewView.swift
//  mBook
//
//  Created by 郑月华 on 2020/08/06.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
import PartialSheet

enum EditView{
    case itemAllPropertyInfo, itemAddText
}
struct MyItemPreviewView: View {
    @EnvironmentObject var partialSheet : PartialSheetManager
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var model: Model
    
    @State var itemAllPropertyInfoUp = false
    @State var itemAddTextUp = false
    // 商品情報
    @Binding var item :ItemDetail
    // 商品詳細画面全体属性
    @State var itemAllPropertyInfo = [String: String]()
    @State var editeView:EditView = .itemAllPropertyInfo
    @State var manaColor:ManaColor = ManaColor()
    
    // 文字追加
    @State var itemAddTextTarger = false
    
    @State var itemAddPhotoTarger = false
    
    @State var hDetailList = [HDetail]()
    
    
    
    var body: some View {
        VStack{
            editBar
            preView
        }.setVStackToTop()
        .padding()
        .addPartialSheet()
        .onAppear(){
            self.manaColor.mbColor = ItemDispDetail.getItemDispDetail(itemDispDetail: item.itemDispDetail).getBCColor()
            self.itemAllPropertyInfo = ItemDispDetail.getItemDispDetail(itemDispDetail: item.itemDispDetail).itemAllPropertyInfo ?? [String:String]()
        }
    }
    
    var editBar: some View{
        VStack(spacing:0){
            HStack(spacing:0){
                Group{
                    Spacer()
                    Image(systemName: "paintbrush")
                        .setImageToButton(action: {
                            self.itemAllPropertyInfoUp.toggle()
                        })
                        .setMBColorWithSheet(isPresented: $itemAllPropertyInfoUp, model: model, manaColor: self.$manaColor, onSelect: { manaColor in
                            self.itemAllPropertyInfo[MenuCon.ITEM_ALL_PROPERTY_BC_COLOR_VALUE] = String(format: "%.0f,%.0f,%.0f,%.0f", manaColor.mbColor.red,manaColor.mbColor.green,manaColor.mbColor.blue,manaColor.mbColor.opacity)
                            let dispdetail = ItemDispDetail.getItemDispDetail(itemDispDetail: item.itemDispDetail)
                            dispdetail.setBCColor(color: manaColor.mbColor)
                            item.itemDispDetail = dispdetail.getJsonString()
                            
                        })
                    Spacer()
                    Image(systemName: "a")
                        .setImageToButton(){
                            self.itemAddTextUp.toggle()
                        }
                        
                        .sheet(isPresented: $itemAddTextUp) {
                            MBTextAddView(item:item, onSelect: {hDetail in
                                print("\(hDetail.type)")
                                self.hDetailList.append(hDetail)
                                print("\(self.hDetailList.count)")
                                
                            })
                        }
                    Spacer()
                    Image(systemName: "photo")
                        .setImageToButton(){
                            self.itemAddPhotoTarger.toggle()
                        }
                        .actionSheet(isPresented: self.$itemAddPhotoTarger) { ActionSheet(title: Text("画像選択"), buttons: [
                            .default(Text("商品代表写真")){
                                self.hDetailList.append(HDetail(type: .PHOTO, photoNumber: 0))
                            },
                            
                            //ITEM_FREESTRING
                            .destructive(Text("Cancel"))
                        ])
                        }
                    Spacer()
                }
                Group{
                    Image(systemName: "video.badge.plus")
                        .setImageToButton(){
                            
                        }
                    Spacer()
                    Image(systemName: "arrow.up.arrow.down.square")
                        .setImageToButton(){
                            
                        }
                    Spacer()
                    Image(systemName: "trash")
                        .setImageToButton(){
                            
                        }
                    Spacer()
                }
            }.font(.title)
            
            .foregroundColor(.blue)
            .frame(height:50)
            
            Divider().frame(width:UIScreen.main.bounds.width)
        }
        
    }
    
    //    func getHtextList()->[HText]{
    //        var htext = HText()
    //        htext.type = 1
    //        htext.text = "test"
    //        var htextList = [HText]()
    //        htextList.append(htext)
    //        return htextList
    //    }
    
    @State var itemEditTextUp = false
    @State var hDetail:HDetail?
    @State var edting = 0
    var preView: some View {
        print("ddd:\(self.hDetailList.count)")
        return ScrollView{
            VStack{
                //List{
                ForEach(0..<self.hDetailList.count, id: \.self){i in
                    self.hDetailList[i].getHDetailView(item:item)
                        .onTapGesture {
                            self.edting = i
                            self.hDetail = self.hDetailList[i]
                            self.itemEditTextUp.toggle()
                        }
                }
            }
            .sheet(isPresented: $itemEditTextUp) {
                MBTextAddView(hDetail:hDetail!, item:item, onSelect: {hDetail in
                    self.hDetailList[self.edting] = hDetail
//                    let dispdetail = ItemDispDetail.getItemDispDetail(itemDispDetail: item.itemDispDetail)
//                    dispdetail.setHDetailList(detail: self.hDetailList)
//                    item.itemDispDetail = dispdetail.getJsonString()
                })
            }
            
        }.frame(width:UIScreen.main.bounds.width)
        .setItemAllProperty(itemAllPropertyInfo: self.itemAllPropertyInfo)
    }
}

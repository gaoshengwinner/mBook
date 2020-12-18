//
//  MyItemListView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/29.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyItemListView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var model: Model
    @State var editMode = EditMode.inactive
    @State var addItem = ItemDetail()
    let pagePadding = CGFloat(20)
    let listPicWith = UIScreen.main.bounds.width*0.38
    let listItemNameWith:CGFloat
    
    @State var beDisplayAddItem = false
    @State var itemList = [ItemDetail]()
    
    init() {
        //        取消List的横线
        UITableView.appearance().separatorStyle = .none
        listItemNameWith = UIScreen.main.bounds.width - listPicWith - pagePadding
    }
    var body: some View {
        VStack(spacing:0){
            Group{
                self.listViewDisplay
            }
        }.navigationBarItems(trailing:
            Button(action: {
                self.beDisplayAddItem.toggle()
            }) {
                Image(systemName: "plus").foregroundColor(.blue)
                    .font(.title)
        })
        
    }
    var listViewDisplay: some View {
        VStack(spacing:0){
            ScrollView{
                VStack(spacing:0){
                    ForEach(0..<self.model.items.count){i in
                        NavigationLink(destination: MyItemEditTabView(itemIndex: i)) {
                            self.itemDisplyStyle(self.model.items[i])
                        }
                        Divider().frame(height:10)
                    }
                    .onMove(perform: { from,to in
                        self.model.items.move(fromOffsets: from, toOffset: to)
                    })
                }.environment(\.editMode, self.$editMode)
            }.environment(\.editMode, self.$editMode)
                .padding(0)
                .padding(pagePadding)
                .navigationBarTitle("商品一覧",displayMode: .inline)
                .sheet(isPresented: $beDisplayAddItem) {
                    MyAddItemView(item: self.$addItem)
                        .environmentObject(self.model)
            }
        }
    }
    
    func itemDisplyStyle(_ item:ItemDetail)->some View{
        VStack(alignment:.leading,spacing:0){
            HStack(alignment:.top){
                if !item.itemMainPicUrl.isEmpty {
                    MBWebImageView(imagUrl: item.itemMainPicUrl)
                        .frame(width:self.listPicWith)
                    VStack(alignment: .leading){
                        HStack(alignment: .top){
                            Text(item.itemName).font(.system(size: 17))
                                .foregroundColor(self.colorScheme == .dark ? .white:.black)
                            Spacer()
                            Text("\(item.itemPrice)円").foregroundColor(.red).font(.system(size: 17))
                        }
                        Text(item.itemDescr).font(.system(size: 17)).fontWeight(.thin)
                            .foregroundColor(self.colorScheme == .dark ? .white:.black)
                            .lineLimit(4)
                    }.frame(width:listItemNameWith)
                } else {
                    VStack{
                        HStack{
                            Text(item.itemName).font(.system(size: 17))
                                .foregroundColor(self.colorScheme == .dark ? .white:.black)
                            Spacer()
                            Text("\(item.itemPrice)円").foregroundColor(.red).font(.system(size: 17))
                        }
                        HStack{
                            Text(item.itemDescr).font(.system(size: 17)).fontWeight(.thin)
                                .foregroundColor(self.colorScheme == .dark ? .white:.black)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

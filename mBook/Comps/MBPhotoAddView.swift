//
//  MBPhotoAddView.swift
//  mBook
//
//  Created by 郑月华 on 2020/09/22.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct MBPhotoAddView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var item:ItemDetail
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MBPhotoAddView_Previews: PreviewProvider {
    static var previews: some View {
        MBPhotoAddView()
    }
}

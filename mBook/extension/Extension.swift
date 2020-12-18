//
//  Extension.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/31.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

public extension View {
    
    func setOnTapCloseKeyBoard()->some View{
        self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    
    func createInutText(errorValue:String) -> some View {
        return VStack(spacing:0){
            self
            Rectangle()
                .frame(height: 1.0, alignment: .bottom)
                .foregroundColor(Color.blue)
            HStack{
                Text(errorValue).foregroundColor(.red)
                Spacer()
            }
        }
    }
    
    func createPopuView(imagUrl: String,number:Int = 1, count:Int = 1, wh:CGFloat = 40, onTagImag:@escaping()->Void) -> some View{
        return ZStack{
            GeometryReader { geometry in
                self
                MBWebImageView(imagUrl: imagUrl)
                    
                    .frame(width:wh, height: wh)
                    .font(.title)
                    .foregroundColor(.blue)
                    .offset(x: self.caclWitdh(geometry.size.width, wh:wh, number: number,count: count ), y: (geometry.size.height - wh - CGFloat(3)))
                    .onTapGesture {
                        onTagImag()
                }
                
            }
        }
    }
    
    func setTextFieldWithLabel(_ label:String, text: Binding<String>)-> some View{
        VStack(alignment: .leading, spacing: 10.0) {
            Text(label).font(.headline)
            HStack{
                self
                    //.padding(.all)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    
                CopyPasterView(text: text)
                
            }.background(Color(red: 239.0/255.0, green: 243.0/255, blue: 244.0/255.0, opacity:1.0))
            
        }
    }
    
    func setTextFieldStyle()-> some View{
        self.background(Color(red: 239.0/255.0, green: 243.0/255, blue: 244.0/255.0, opacity:1.0))
            .font(.system(size: 20))
            .frame(height:35)
    }
    
    func setVStackToTop()->some View{
        HStack(alignment:.top,spacing: 0){
            VStack(spacing: 0){
                self
                Spacer()
            }
        }
    }
    
    func setImageToButton(action:@escaping ()->Void)->some View{
        Button(action: {
            action()
        }) {
            self
        }
    }

    
    
    private func caclWitdh(_ geometryWidht:CGFloat, wh:CGFloat, number:Int, count:Int) -> CGFloat{
        return geometryWidht / CGFloat(count + 1 ) * CGFloat(number) - wh / 2
        
        
    }
    
    
}

struct CopyPasterView: View {
    @Binding var text:String
    var body: some View {
        Image(systemName: "link")
            .onTapGesture {
                self.text = UIPasteboard.general.string ??  self.text
        }
    }
}



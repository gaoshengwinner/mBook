//
//  CommentInputView.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/19.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

struct CommentInputView: UIViewRepresentable {
    @Binding var text:String
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.backgroundColor = Constants.inputBGC as UIColor
        view.font = .systemFont(ofSize: 18)
        //view.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.delegate = context.coordinator
        view.text = text
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
    class Coordinator :NSObject, UITextViewDelegate{
        let parent:CommentInputView
        
        init(_ view: CommentInputView) {parent = view}
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
    }
    
}


//
//  CodeTextView.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 22/8/21.
//

import SwiftUI


struct CodeTextView: UIViewRepresentable {
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        // Set the attributed text for lesson
        textView.attributedText = model.codeText
        // Scroll back to top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}

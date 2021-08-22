//
//  TestView.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 22/8/21.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        if let currentQuestion = model.currentQuestion {
            VStack {
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                // Question
                CodeTextView()
                // Options
                
                // Button
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        } else {
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

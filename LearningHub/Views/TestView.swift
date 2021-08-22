//
//  TestView.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 22/8/21.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    @State var selectedAnsIndex: Int?
    @State var submitted = false
    @State var numCorrect = 0
    
    var body: some View {
        if let currentQuestion = model.currentQuestion {
            VStack(alignment: .leading) {
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal,20)
                // Options
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(0..<currentQuestion.answers.count, id:\.self) {index in
                        
                            
                            Button(action: {
                                self.selectedAnsIndex = index
                            }, label: {
                                
                                ZStack {
                                    if !submitted {
                                        RectangleCard()
                                            .foregroundColor(index == selectedAnsIndex ? Color(.systemGray5) : .white)
                                    } else {
                                        if index == selectedAnsIndex && index == currentQuestion.correctIndex || index == currentQuestion.correctIndex {
                                            RectangleCard()
                                                .foregroundColor(.green)
                                        } else if index == selectedAnsIndex && index != currentQuestion.correctIndex {
                                            RectangleCard()
                                                .foregroundColor(.red)
                                        } else {
                                            RectangleCard()
                                                .foregroundColor(.white)
                                        }
                                    }
                                    Text(currentQuestion.answers[index])
                                }
                            })
                            .disabled(submitted)
                    
                    }
                }
                .accentColor(.black)
                .padding()
        }
                
                // Button
                Button(action: {
                    self.submitted = true
                    if selectedAnsIndex == currentQuestion.correctIndex {
                        numCorrect += 1
                    }
                }, label: {
                    ZStack {
                        RectangleCard()
                            .foregroundColor(.green)
                    Text("Submit")
                        .bold()
                        .foregroundColor(.white)
                    }
                })
                .disabled(selectedAnsIndex == nil)
                .padding()
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

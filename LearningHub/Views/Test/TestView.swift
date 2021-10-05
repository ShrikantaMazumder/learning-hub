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
    @State var resultView = false
    
    var body: some View {
        if model.currentQuestion != nil && resultView == false {
           
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
                    ForEach(0..<model.currentQuestion!.answers.count, id:\.self) {index in
                        
                            
                            Button(action: {
                                self.selectedAnsIndex = index
                            }, label: {
                                
                                ZStack {
                                    if !submitted {
                                        RectangleCard()
                                            .foregroundColor(index == selectedAnsIndex ? Color(.systemGray5) : .white)
                                    } else {
                                        if index == selectedAnsIndex && index == model.currentQuestion!.correctIndex || index == model.currentQuestion!.correctIndex {
                                            RectangleCard()
                                                .foregroundColor(.green)
                                        } else if index == selectedAnsIndex && index != model.currentQuestion!.correctIndex {
                                            RectangleCard()
                                                .foregroundColor(.red)
                                        } else {
                                            RectangleCard()
                                                .foregroundColor(.white)
                                        }
                                    }
                                    Text(model.currentQuestion!.answers[index])
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
                    if submitted {
                        if  model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                            self.resultView = true
                        } else {
                            model.nextQuestion()
                            self.submitted = false
                            selectedAnsIndex = nil
                        }
                        
                    } else {
                        self.submitted = true
                        if selectedAnsIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }
                    }
                }, label: {
                    ZStack {
                        RectangleCard()
                            .foregroundColor(.green)
                        Text(buttonText)
                        .bold()
                        .foregroundColor(.white)
                    }
                })
                .disabled(selectedAnsIndex == nil)
                .padding()
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        } else if resultView {
            TestResultView(marks: numCorrect)
        } else {
            ProgressView()
        }
    }
    
    var buttonText: String {
        
        // Check if answer has been submitted
        if submitted == true {
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                // This is the last question
                return "Finish"
            }
            else {
                // There is a next question
                return "Next"
            }
        }
        else {
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

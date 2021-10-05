//
//  TestResultView.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 23/8/21.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var model: ContentModel
    var marks:Int
    
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            return ""
        }
        
        let pct = Double(marks)/Double(model.currentModule!.test.questions.count)
        
        if pct > 0.5 {
            return "Awesome!"
        }
        else if pct > 0.2 {
            return "Doing great!"
        }
        else {
            return "Keep learning."
        }
    }
    var body: some View {
        VStack {
            Spacer()
            
            Text(resultHeading)
                .font(.title)
            
            Spacer()
            
            Text("You got \(marks) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            
            Spacer()
            
            Button {
                
                // Send the user back to the home view
                model.currentTestSelected = nil
                
            } label: {
                
                ZStack {
                    RectangleCard()
                        .foregroundColor(.green)
                        
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                }
                
            }
            .padding()
            
            Spacer()

        }
    }
}

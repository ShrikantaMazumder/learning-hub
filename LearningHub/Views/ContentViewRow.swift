//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Shrikanta Mazumder on 22/8/21.
//

import SwiftUI

struct ContentViewRow: View {
    var index: Int
    @EnvironmentObject var model: ContentModel
    
    var lesson: Lesson {
        if model.currentModule != nil && index < model.currentModule!.content.lessons.count {
            return model.currentModule!.content.lessons[index]
        } else {
            return Lesson(id: "", title: "", video: "", duration: "", explanation: "")
        }
    }
    
    var body: some View {
        
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack(spacing: 30) {
                Text(String(index + 1))
                    .bold()
                
                VStack(alignment: .leading) {
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                        .font(.caption)
                }
                
                Spacer()
            }
            .padding()
        }
        .padding(.bottom, 5)
    }
}

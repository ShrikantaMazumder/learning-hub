//
//  ContentView.swift
//  LearningApp
//
//  Created by Shrikanta Mazumder on 22/8/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        NavigationLink(
                            destination: ContentDetailView().onAppear(perform: {
                                model.beginLesson(index)
                            }),
                            label: {
                                // Lesson card
                                ContentViewRow(index: index)
                            })
                       
                        
                    }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}



//
//  ContentView.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 21/8/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                Text("What do you want to do today")
                    .padding(.leading, 20)
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules) {module in
                            VStack(spacing: 20) {
                                NavigationLink(
                                    destination: ContentView()
                                        .onAppear(perform: {
                                            model.getLessons(module: module) {
                                                model.beginModule(module.id)
                                            }
                                        
                                        }),
                                    tag: module.id.hash,
                                    selection: $model.currentContentSelected,
                                    label: {
                                        // Learning Card
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) lessons", time: module.content.time)
                                           
                                    })
                                
                                
                                NavigationLink(
                                    destination: TestView().onAppear(perform: {
                                        model.getQuestions(module: module) {
                                            model.beginTest(module.id)
                                        }
                                    }),
                                    tag: module.id.hash,
                                    selection: $model.currentTestSelected,
                                    label: {
                                        // Test Card
                                        HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) questions", time: module.test.time)
                                    })
                                
                                NavigationLink(
                                    destination: EmptyView(),
                                    label: {
                                        EmptyView()
                                    })
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                    
                }
            }
            .navigationTitle("Get Started")
            .onChange(of: model.currentContentSelected ){ changeValue in
                if changeValue == nil {
                    model.currentModule = nil
                }
            }
            .onChange(of: model.currentTestSelected ){ changeValue in
                if changeValue == nil {
                    model.currentModule = nil
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}

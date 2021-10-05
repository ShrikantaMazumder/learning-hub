//
//  ContentDetailView.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 22/8/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            // Show video player
            if let url = url {
                VideoPlayer(player: AVPlayer(url: url))
                    .cornerRadius(10)
            }
            
            // Description
            CodeTextView()
            
            // Show next button
            if model.hasNextLesson() {
                Button(action: {
                    model.nextLesson()
                }, label: {
                    ZStack {
                        RectangleCard()
                            .foregroundColor(Color.green)
                        Text("Next Lesson")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
            } else {
                // Show completed button instead
                Button(action: {
                    model.currentContentSelected = nil
                }, label: {
                    ZStack {
                        RectangleCard()
                            .foregroundColor(Color.green)
                        Text("Completed")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
            }
        }
        .padding()
        .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}


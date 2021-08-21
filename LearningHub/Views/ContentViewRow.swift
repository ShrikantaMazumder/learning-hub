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
    
    var body: some View {
        let lession = model.currentModule!.content.lessons[index]
        
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
                    Text(lession.title)
                        .bold()
                    Text(lession.duration)
                        .font(.caption)
                }
                
                Spacer()
            }
            .padding()
        }
        .padding(.bottom, 5)
    }
}

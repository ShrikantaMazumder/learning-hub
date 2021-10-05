//
//  LaunchView.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 5/10/21.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        if model.isLoggedIn == false {
            AuthView()
                .onAppear {
                    model.checkLogin()
                }
        } else {
            TabView{
                HomeView()
                    .tabItem {
                        Image(systemName: "book")
                        Text("Learn")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

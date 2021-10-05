//
//  LearningHubApp.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 21/8/21.
//

import SwiftUI
import Firebase

@main
struct LearningHubApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}

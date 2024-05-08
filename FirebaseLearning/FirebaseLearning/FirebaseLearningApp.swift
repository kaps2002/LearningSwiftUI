//
//  FirebaseLearningApp.swift
//  FirebaseLearning
//
//  Created by Roro on 06/05/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseLearningApp: App {
    
    init() {
        FirebaseApp.configure()
        print("firebase configured!!!")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
            }
        }
    }
}

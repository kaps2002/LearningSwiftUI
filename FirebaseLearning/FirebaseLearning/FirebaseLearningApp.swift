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
    @StateObject private var languageManager = LanguageManager()
    
    init() {
        FirebaseApp.configure()
        print("firebase configured!!!")
    }
    
    var body: some Scene {
        //CrashView()
        WindowGroup {
            ContentView()
                .environmentObject(languageManager)
        }
        //ContentView()
        
    }
}

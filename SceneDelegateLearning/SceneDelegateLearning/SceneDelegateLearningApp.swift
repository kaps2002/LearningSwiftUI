//
//  SceneDelegateLearningApp.swift
//  SceneDelegateLearning
//
//  Created by Roro on 21/05/24.
//

import SwiftUI

@main
struct SceneDelegateLearningApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

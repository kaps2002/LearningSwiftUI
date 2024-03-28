//
//  DataFlowApp.swift
//  DataFlow
//
//  Created by Roro on 28/03/24.
//

import SwiftUI

@main
struct DataFlowApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

//
//  PartialAppApp.swift
//  PartialApp
//
//  Created by Roro on 29/05/24.
//

import SwiftUI

@main
struct CostraClipApp: App {
    @StateObject private var model = CoffeeModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(model)
            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: handleUserActivity)
        }
    }
    
    func handleUserActivity(_ userActivity: NSUserActivity) {
        if let webpage = userActivity.webpageURL {
            let coffeeId = webpage.lastPathComponent
            if !coffeeId.isEmpty {
                print("new coffee id: \(coffeeId)")
                model.findCoffeeById(id: coffeeId)
            }
        }
    }
}

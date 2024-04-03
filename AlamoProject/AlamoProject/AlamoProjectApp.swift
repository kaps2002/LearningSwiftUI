//
//  AlamoProjectApp.swift
//  AlamoProject
//
//  Created by Roro on 03/04/24.
//

import SwiftUI

@main
struct AlamoProjectApp: App {
    @State private var selection = 0

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selection) {
                PostView()
                    .tabItem {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    .tag(0)
                DogsFactsView()
                    .tabItem {
                        Image(systemName: "dog.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    .tag(1)
            }
        }
    }
}

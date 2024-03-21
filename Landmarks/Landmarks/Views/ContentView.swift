//
//  ContentView.swift
//  Landmarks
//
//  Created by Roro on 16/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = Tab.featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CategoryHome()
                .tabItem {
                    Label(
                        title: {
                            Text("Featured")
                        },
                        icon: {
                            Image(systemName: "star.fill")
                        }
                    )
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem {
                    Label(
                        title: {
                            Text("List")
                        },
                        icon: {
                            Image(systemName: "list.bullet")
                        }
                    )
                }
                .tag(Tab.list)
        }
        
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

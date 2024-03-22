//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Roro on 21/03/24.
//

import SwiftUI

struct CategoryHome: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    var body: some View {
        NavigationSplitView {
            ScrollView {
                PageView(pages: modelData.features.map { FeatureCard( landmark: $0 ) })
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id:\.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Featured 🎊")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label(
                        title: { Text("User Profile") },
                        icon: { 
                            Image(systemName: "person.crop.circle")
                        }
                    )
                }
            }.sheet(isPresented: $showingProfile, content: {
                ProfileView()
                    .environment(modelData)
            })
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}

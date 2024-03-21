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
                modelData.features[1].image
                    .resizable()
                    .clipped()
//                    .frame(width: 200, height: 200)
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
                        icon: { Image(systemName: "person.crop.circle").symbolRenderingMode(.monochrome) }
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

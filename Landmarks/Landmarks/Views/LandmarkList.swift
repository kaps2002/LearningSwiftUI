//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Roro on 18/03/24.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavorites = false
        
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavorites || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavorites) {
                    Text("Label")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetails(landmark: landmark)
                    } label : {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            .navigationTitle("Landmarks")
        } detail: {
        Text("Select the Landmark")
            .frame(width: 240, height: 60)
            .background(.teal)
            .font(.title2)
            .cornerRadius(10)
        }
        
    }
}
#Preview {
    LandmarkList()
}

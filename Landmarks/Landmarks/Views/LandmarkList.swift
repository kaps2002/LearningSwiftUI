//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Roro on 18/03/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
        List(landmarks) { landmark in
            NavigationLink {
                LandmarkDetails(landmark: landmark)
            } label : {
                LandmarkRow(landmark: landmark)
            }
        }
        
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select the Landmark")
        }
        
    }
}
#Preview {
    LandmarkList()
}

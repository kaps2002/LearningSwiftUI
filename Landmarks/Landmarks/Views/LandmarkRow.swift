//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Roro on 16/03/24.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

#Preview {
    List(landmarks) { landmark in
        LandmarkRow(landmark: landmark)
    }
}

//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Roro on 16/03/24.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
//    @State var isStarred = false
//
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    LandmarkRow(landmark: landmarks[0])
}

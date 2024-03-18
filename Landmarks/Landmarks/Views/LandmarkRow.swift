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
//            Image(systemName: isstarred ? "star.fill" : "star")
//                .symbolRenderingMode(.multicolor)
//                .onTapGesture {
//                    isstarred.toggle()
//                }
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            } else {
                Image(systemName: "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

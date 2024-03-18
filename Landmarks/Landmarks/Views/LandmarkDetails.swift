//
//  LandmarkDetails.swift
//  Landmarks
//
//  Created by Roro on 18/03/24.
//

import SwiftUI

struct LandmarkDetails: View {
    var landmark: Landmark
    var body: some View {
        VStack {
            MapView(landmark: landmark)
                .frame(height: 400)
            CircleView(landmark: landmark)
                .offset(y: -130)
                .padding(.bottom, -130)
            ScrollView{
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.title3)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    Text("Description")
                        .font(.title2)
                    Text(landmark.description)
                }
            }.padding()
        }
        Spacer()
    }
}

#Preview {
    LandmarkDetails(landmark: landmarks[0])
}

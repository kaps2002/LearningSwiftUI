//
//  LandmarkDetails.swift
//  Landmarks
//
//  Created by Roro on 18/03/24.
//

import SwiftUI

struct LandmarkDetails: View {
    
    @Environment(ModelData.self) var modelData
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var landmark: Landmark
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ScrollView {
            
            MapView(landmark: landmark)
                .frame(height: 400)
            CircleView(landmark: landmark)
                .offset(y: -130)
                .padding(.bottom, -130)
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                            .fontWeight(.semibold)
                        FavouriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
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
            }
            .padding()
            
        }.edgesIgnoringSafeArea(.all)
        Spacer()
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetails(landmark: modelData.landmarks[7])
        .environment(modelData)
    
}

//
//  SliderView.swift
//  Landmarks
//
//  Created by Roro on 19/03/24.
//

import SwiftUI

struct SliderView: View {
    @Environment(ModelData.self) var modelData
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var landmark: Landmark
    
    var body: some View {
        @Bindable var modelData = modelData
        VStack{
            CircleView(landmark: landmark)
                .padding(.top, 10)
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
                    .fontWeight(.semibold)

                ScrollView{
                    Text(landmark.description)
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 30))
    }
}

#Preview {
    let modelData = ModelData()
    return SliderView(landmark: modelData.landmarks[7])
        .environment(modelData)
}

//
//  LandmarkDetails.swift
//  Landmarks
//
//  Created by Roro on 18/03/24.
//

import SwiftUI

struct LandmarkDetails: View {
    
    @Environment(ModelData.self) var modelData
    @State private var isShowingSlider = false
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var landmark: Landmark
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ZStack {
            MapView(landmark: landmark)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                VStack {
                    CircleView(landmark: landmark)
                        .offset(y: -100)
                        .padding(.bottom, -100)
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
                                .multilineTextAlignment(.leading)
                            Text(landmark.description)
                        }
                    }
                    .onTapGesture {
                        isShowingSlider = true
                    }
                }
                .padding()
                .background(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 200)
                
            }
            
            
            
        }
        .sheet(isPresented: $isShowingSlider) {
            SliderView(isShowingSlider: self.$isShowingSlider, landmark: landmark)
        }
        
        
    }
    
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetails(landmark: modelData.landmarks[1])
        .environment(modelData)
    
}

//
//  SliderView.swift
//  Landmarks
//
//  Created by Roro on 19/03/24.
//

import SwiftUI

struct SliderView: View {
    @Environment(ModelData.self) var modelData
    @Binding var isShowingSlider: Bool // Binding to control the visibility of the slider screen
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var landmark: Landmark
    
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView{
            CircleView(landmark: landmark)
                .offset(y: 10)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .fontWeight(.semibold)
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
            
        }.padding()
        
    }
}

#Preview {
    let modelData = ModelData()
    return SliderView(isShowingSlider: .constant(false), landmark: modelData.landmarks[7])
        .environment(modelData)
    
}

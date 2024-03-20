//
//  LandmarkDetails.swift
//  Landmarks
//
//  Created by Roro on 18/03/24.
//

import SwiftUI

struct LandmarkDetails: View {
    
    @Environment(ModelData.self) var modelData
    
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var landmark: Landmark
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ZStack {
            VStack {
                MapView(landmark: landmark)
                    .edgesIgnoringSafeArea(.all)
            }
            
            GeometryReader { proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                return AnyView(
                    VStack {
                        SliderView(landmark: landmark)
                            .padding(.bottom, offset == -((height-100)/3) ? (height-100)/1.5 : 0)
                            .ignoresSafeArea(edges: .bottom)
                    }
                    .offset(y: height - 270)
                    .offset(y: -offset > 0 ? -offset <= (height - 100) ? offset: -(height - 100) : 0 )
                    .gesture(
                        DragGesture().updating($gestureOffset , body: { value, out , _ in
                            out = value.translation.height
                            onChange()
                        }).onEnded({ value in
                            let maxHeight = height - 270
                            withAnimation{
                                if -offset > 200 && -offset < maxHeight / 2 {
                                    offset = -(maxHeight / 3)
                                } else if -offset > maxHeight / 2 {
                                    offset = -maxHeight
                                }
                                else {
                                    offset = 0
                                }
                            }
                            lastOffset = offset
                        })
                    )
                )
            }
        }
        
    }
    func onChange() {
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetails(landmark: modelData.landmarks[5])
        .environment(modelData)
    
}

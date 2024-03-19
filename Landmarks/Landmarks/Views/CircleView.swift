//
//  CircleView.swift
//  Landmarks
//
//  Created by Roro on 16/03/24.
//

import SwiftUI

struct CircleView: View {
    var landmark: Landmark
    var body: some View {
        landmark.image
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.black, lineWidth: 4)
            }
            .shadow(radius: 5)

    }
}

#Preview {
    CircleView(landmark: ModelData().landmarks[0])
}

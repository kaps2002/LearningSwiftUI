//
//  CircleView.swift
//  Landmarks
//
//  Created by Roro on 16/03/24.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Image(.joshua)
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.black, lineWidth: 4)
            }
            .shadow(radius: 5)

    }
}

#Preview {
    CircleView()
}

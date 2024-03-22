//
//  ExplicitAnimations.swift
//  AnimationsTutorial
//
//  Created by Roro on 22/03/24.
//

import SwiftUI

struct RotationAnimation: View {
    @State private var animationCount = 0.0
    
    var body: some View {
        Button("Click me") {
            withAnimation {
                animationCount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.black)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationCount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    RotationAnimation()
}

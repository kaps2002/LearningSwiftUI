//
//  AnimationBinding.swift
//  AnimationsTutorial
//
//  Created by Roro on 22/03/24.
//

import SwiftUI

struct AnimationBinding: View {
    @State private var animationCount3 = 1.0
    var body: some View {
        VStack {
            Stepper("Scale me", value: $animationCount3.animation(
                .spring(duration: 1, bounce: 0.5)
            ), in: 1...10)
            Spacer()
            Button("Tap me") {
                animationCount3 += 1
            }
            .padding(50)
            .background(.red)
            .clipShape(Circle())
            .scaleEffect(animationCount3)
        }
        .padding()
    }
}

#Preview {
    AnimationBinding()
}

//
//  ColorAimatio.swift
//  AnimationsTutorial
//
//  Created by Roro on 22/03/24.
//

import SwiftUI

struct ColorAnimation: View {
    @State private var isAnimation = false

    var body: some View {
        Button("Click me") {
            isAnimation.toggle()
        }
        .frame(width: 200, height: 200)
        .background(isAnimation ? .red : .blue)
        .animation(.default, value: isAnimation)
        .foregroundColor(.black)
        .clipShape(RoundedRectangle(cornerRadius: isAnimation ? 50 : 0))
        .animation(.bouncy, value: isAnimation)
    }
}

#Preview {
    ColorAnimation()
}

//
//  RevolutionAnimations.swift
//  AnimationsTutorial
//
//  Created by Roro on 26/03/24.
//

import SwiftUI

struct RevolutionAnimations: View {
    
    @State private var angle: Double = 0.0
    var body: some View {
        ZStack {
            Image(systemName: "sun.max.fill")
                .resizable()
                .symbolRenderingMode(.multicolor)
                .frame(width: 70, height: 70)
            
            Image(systemName: "globe")
                .resizable()
                .foregroundColor(.green)
                .frame(width: 50, height: 50)
                .offset(x: 0, y: 135)
                .rotationEffect(.degrees(angle))
            
        }
        .onAppear() {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                angle = 360.0
            }
        }
    }
}

#Preview {
    RevolutionAnimations()
}

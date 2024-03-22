//
//  ContentView.swift
//  AnimationsTutorial
//
//  Created by Roro on 22/03/24.
//

import SwiftUI

struct ImplicitAnimations: View {
    
    @State private var animationCount1 = 1.0

    var body: some View {
            //1. Zoom out
            Button("tap me") {
                animationCount1 += 1
            }
            .padding(50)
            .background(.red)
            .clipShape(Circle())
            .scaleEffect(animationCount1)
            .blur(radius: (animationCount1 - 1))
            .animation(.linear, value: animationCount1)
            
            
    }
}

#Preview {
    ImplicitAnimations()
}

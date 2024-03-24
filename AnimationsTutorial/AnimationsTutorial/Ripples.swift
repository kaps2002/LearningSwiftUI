//
//  CustomAnimations.swift
//  AnimationsTutorial
//
//  Created by Roro on 22/03/24.
//

import SwiftUI

struct Ripples: View {
    @State private var animationCount2 = 1.0
    
    var body: some View {
        VStack{
            //1. Ripples
            
            Button("tap me") {
                //animationCount2 += 1
            }
            .padding(50)
            .background(.red)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationCount2)
                    .opacity(2 - animationCount2)
                    .animation(
                        .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationCount2
                    )
            )
            .onAppear{
                animationCount2 = 2
            }
        }
        .padding()
    }
}

#Preview {
    Ripples()
}

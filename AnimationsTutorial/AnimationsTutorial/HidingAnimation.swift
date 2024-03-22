//
//  HidingAnimation.swift
//  AnimationsTutorial
//
//  Created by Roro on 22/03/24.
//

import SwiftUI

struct HidingAnimation: View {
    @State private var isShowingBox = false
    
    var body: some View {
        VStack {
            Button("tap me") {
                withAnimation {
                    isShowingBox.toggle()

                }
            }
            
            if isShowingBox {
               Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
        }
    }
}

#Preview {
    HidingAnimation()
}

//
//  DotProgress.swift
//  AnimationsTutorial
//
//  Created by Roro on 23/03/24.
//

import SwiftUI

struct DotLoading: View {
    @State private var isAnimating = false
    var body: some View {
        HStack(spacing: 16) {
            ForEach(1..<4) {index in
                Circle()
                    .fill(Color.blue)
                    .frame(width: 15, height: 15)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(
                        Animation
                            .easeInOut(duration: 0.9)
                            .repeatForever()
                            .delay(Double(index - 1) / 4)
                    )
            }
            
//            Circle()
//                .fill(Color.blue)
//                .frame(width: 16, height: 16)
//                .opacity(isAnimating ? 1 : 0)
//                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.2))
//            Circle()
//                .fill(Color.blue)
//                .frame(width: 16, height: 16)
//                .opacity(isAnimating ? 1 : 0)
//                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.4))
        }
        .onAppear {
            self.isAnimating = true
        }
        
    }
}

#Preview {
    DotLoading()
}

//
//  Ripples2.swift
//  AnimationsTutorial
//
//  Created by Roro on 23/03/24.
//

import SwiftUI

struct Ripples2: View {
    @State private var scalSize: CGFloat = .zero
    @State private var isAnimating = false

    let timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .edgesIgnoringSafeArea(.all)
            
            ForEach(1..<200) {index in
                addCircleView(delayValue: CGFloat(index))
            }
            
            Circle()
                .fill(.green)
                .frame(width: 150, height: 150)
                .overlay {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.black.opacity(0.6))
                        .font(.system(size: 50))
                }
        }
        .onReceive(timer) { _ in
            withAnimation(Animation.easeInOut(duration: 1.0)) {
                scalSize = 3.0
                isAnimating.toggle()
            }
        }
    }
    @ViewBuilder
    func addCircleView(delayValue: CGFloat) -> some View {
        Circle()
            .fill(.green.opacity(scalSize == 3 ? 0.0 : 1.3))
            .frame(width: 150, height: 150)
            .scaleEffect(scalSize)
            .animation(.easeInOut(duration: 5.5).delay(delayValue), value: scalSize)
    }
    
}

#Preview {
    Ripples2()
}

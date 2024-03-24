//
//  GesturesAnimate.swift
//  AnimationsTutorial
//
//  Created by Roro on 24/03/24.
//

import SwiftUI

struct GesturesAnimate: View {
    
    let word = Array("Hello World")
    
    @State private var dragAmount: CGSize = .zero
    @State private var dragAmount2: CGSize = .zero
    @State private var enabled = false
    
    var body: some View {
        
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded {_ in 
                        dragAmount = .zero
                    }
            )
            .animation(.spring(), value: dragAmount)
        
        Spacer()
        
        HStack(spacing: 0) {
            ForEach(0..<word.count) { i in
                Text(String(word[i]))
                    .padding(5)
                    .font(.title)
                    .offset(dragAmount2)
                    .animation(
                        .default.delay(Double(i) / 20),
                        value: dragAmount2
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount2 = $0.translation }
                .onEnded { _ in
                    dragAmount2 = .zero
                    enabled.toggle()
                }
        )
    }
}

#Preview {
    GesturesAnimate()
}

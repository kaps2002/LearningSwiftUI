//
//  ContentView.swift
//  LottieDemo
//
//  Created by Roro on 26/04/24.
//

import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    
    var animationFileName: String
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationFileName)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.contentMode = .scaleAspectFill
        return animationView
    }
    
}

struct ContentView: View {
    var body: some View {
        LottieView(animationFileName: "Anime4", loopMode: .loop)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}

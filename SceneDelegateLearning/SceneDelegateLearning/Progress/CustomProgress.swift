//
//  CustomProgress.swift
//  SceneDelegateLearning
//
//  Created by Roro on 22/05/24.
//

import Foundation
import SwiftUI

struct CustomProgress: ViewModifier {
 
    static let SHORT: TimeInterval = 2
    static let LONG: TimeInterval = 3.5
    
    let message: String
    var description: String = ""
    @Binding var isShowing: Bool
    let progressConfig: ProgressConfig
    
    func body(content: Content) -> some View {
        ZStack {
            content
            customProgressView
        }
    }

    private var customProgressView: some View {
        VStack {
            Spacer()
            if isShowing {
                Group {
                    VStack {
                        ProgressView(message)
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                }
                .onTapGesture {
                    isShowing = false
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + progressConfig.duration) {
                        isShowing = false
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 18)
        .animation(progressConfig.animation, value: isShowing)
        .transition(progressConfig.transition)
    }
}

struct ProgressConfig {

  let textColor: Color
  let messageFont: Font
  let backgroundColor: Color
  let duration: TimeInterval
  let transition: AnyTransition
  let animation: Animation

    init(textColor: Color = .white,
         messageFont: Font = .system(size: 14),
         backgroundColor: Color = .black.opacity(0.60),
         duration: TimeInterval = CustomProgress.SHORT,
         transition: AnyTransition = .opacity,
         animation: Animation = .linear(duration: 0.3)) {
        
        self.textColor = textColor
        self.messageFont = messageFont
        self.backgroundColor = backgroundColor
        self.duration = duration
        self.transition = transition
        self.animation = animation
    }
}


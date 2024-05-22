//
//  Toast.swift
//  SceneDelegateLearning
//
//  Created by Roro on 22/05/24.
//

import Foundation
import SwiftUI

struct Toast: ViewModifier {
 
    static let SHORT: TimeInterval = 2
    static let LONG: TimeInterval = 3.5
    
    let message: String
    var description: String = ""
    @Binding var isShowing: Bool
    let toastConfig: ToastConfig
    
    func body(content: Content) -> some View {
        ZStack {
            content
            toastView
        }
    }

    private var toastView: some View {
        VStack {
            Spacer()
            if isShowing {
                Group {
                    VStack {
                        Text(message)
                            .multilineTextAlignment(.center)
                            .foregroundColor(toastConfig.textColor)
                            .font(toastConfig.messageFont)
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 30)
                }
                .background(Capsule().foregroundColor(toastConfig.backgroundColor))
                .onTapGesture {
                    isShowing = false
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + toastConfig.duration) {
                        isShowing = false
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 18)
        .animation(toastConfig.animation, value: isShowing)
        .transition(toastConfig.transition)
    }
}

struct ToastConfig {

  let textColor: Color
  let messageFont: Font
  let backgroundColor: Color
  let duration: TimeInterval
  let transition: AnyTransition
  let animation: Animation

    init(textColor: Color = .white,
         messageFont: Font = .system(size: 14),
         backgroundColor: Color = .black.opacity(0.60),
         duration: TimeInterval = Toast.SHORT,
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

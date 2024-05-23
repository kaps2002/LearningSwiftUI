//
//  Alert.swift
//  SceneDelegateLearning
//
//  Created by Roro on 23/05/24.
//

import Foundation
import SwiftUI

struct CustomAlert: ViewModifier {
    
    let message: String
    let desc: String
    @Binding var isShowing: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            customAlertView
        }
    }

    private var customAlertView: some View {
        VStack {
            if isShowing {
                VStack {}
                    .alert(isPresented: $isShowing) {
                        Alert(title: Text(message), message: Text(desc), dismissButton: .default(Text("OK")))
                    }
            }
        }
    }
}



//
//  ToastView.swift
//  SceneDelegateLearning
//
//  Created by Roro on 22/05/24.
//

import SwiftUI
import UIKit

struct ToastView: View {
    @State var showToast = false
    @State var toastMessage: String = ""
    @State var toastDuration: TimeInterval = 0.0
    
    var body: some View {
        ZStack {}
            .toast(message: toastMessage, isShowing: $showToast, duration: toastDuration)
            .onReceive(NotificationCenter.default.publisher(for: .showToast)) { data in
               
                guard let userInfo = data.userInfo, let message = userInfo[NotificationData.toastMessage], let duration = userInfo[NotificationData.toastDuration] else {
                    showToast = false
                    return
                }
                self.toastMessage = message as! String
                self.toastDuration = duration as! TimeInterval
                showToast = true
            }
    }
    
    static func show(message: String, duration: TimeInterval = Toast.SHORT) {
        print("Show func called")
        NotificationCenter.default.post(name: .showToast, object: nil, userInfo: [NotificationData.toastMessage: message, NotificationData.toastDuration: duration])
    }
}

extension View {
    func toast(message: String, isShowing: Binding<Bool>, duration: TimeInterval) -> some View {
        print("toast func called")
        return self.modifier(Toast(message: message, isShowing: isShowing, toastConfig: .init(duration: duration)))
    }
}

#Preview {
    ToastView()
}

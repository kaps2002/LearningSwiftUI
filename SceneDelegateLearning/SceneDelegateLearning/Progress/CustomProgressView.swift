//
//  Custom.swift
//  SceneDelegateLearning
//
//  Created by Roro on 22/05/24.
//

import SwiftUI
import UIKit

struct CustomProgressView: View {
    
    @State var showProgress = false
    @State var progressMessage: String = ""
    @State var progressDuration: TimeInterval = 0.0
   
    var body: some View {
        ZStack {}
            .customProgress(message: progressMessage, isShowing: $showProgress, duration: progressDuration)
            .onReceive(NotificationCenter.default.publisher(for: .showProgress)) { data in
                guard let userInfo = data.userInfo, let message = userInfo[NotificationData.progressMessage], let duration = userInfo[NotificationData.progressDuration] else {
                    showProgress = false
                    return
                }
                self.progressMessage = message as! String
                self.progressDuration = duration as! TimeInterval
                showProgress = true
            }
    }
    
    static func show(message: String, duration: TimeInterval = CustomProgress.SHORT) {
        NotificationCenter.default.post(name: .showProgress, object: nil, userInfo: [NotificationData.progressMessage: message, NotificationData.progressDuration: duration])
    }
    
}

extension View {
    func customProgress(message: String, isShowing: Binding<Bool>, duration: TimeInterval) -> some View {
        self.modifier(CustomProgress(message: message, isShowing: isShowing, progressConfig: .init(duration: duration)))
    }
}

#Preview {
    ToastView()
}

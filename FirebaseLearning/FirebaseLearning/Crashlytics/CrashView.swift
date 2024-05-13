//
//  CrashView.swift
//  FirebaseLearning
//
//  Created by Roro on 13/05/24.
//

import SwiftUI
import FirebaseCrashlytics

final class CrashManager {
    static let shared = CrashManager()
    private init(){ }
    
    func setUserId(userId: String) {
        Crashlytics.crashlytics().setUserID(userId)
    }
    
    func setValue(value: String, key: String) {
        Crashlytics.crashlytics().setCustomValue(value, forKey: key)
    }
    
    func setIsPremiumValue(isPremium: Bool) {
        setValue(value: isPremium.description.lowercased(), key: "user_is_premium")
    }
    
    func addLog(msg: String) {
        Crashlytics.crashlytics().log(msg)
    }
    
}

struct CrashView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.4).ignoresSafeArea()
            
            VStack(spacing: 30) {
                Button("Click Me 1") {
                    CrashManager.shared.addLog(msg: "Button 1 pressed")
                    let myString: String? = nil
                    let string2 = myString!
                }
                Button("Click Me 2") {
                    CrashManager.shared.addLog(msg: "Button 2 pressed")
                    fatalError("This was a fatal crash")
                }
                Button("Click Me 3") {
                    CrashManager.shared.addLog(msg: "Button 3 pressed")
                    let array: [String] = []
                    let item = array[0]
                }
            }
        }
        .onAppear {
            CrashManager.shared.setUserId(userId: "ABC123")
            CrashManager.shared.setIsPremiumValue(isPremium: true)
        }
    }
}

#Preview {
    CrashView()
}

//
//  SceneDelegate.swift
//  SceneDelegateLearning
//
//  Created by Roro on 21/05/24.
//

import SwiftUI

extension Notification.Name {
    static let showToast = Notification.Name("showToast")
    static let showProgress = Notification.Name("showProgress")
    static let showAlert = Notification.Name("showAlert")
}

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("Scene delegate")
        
        let contentView = ContentView()
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }

    }
    @objc func showToast() {
        // Your custom logic to show a toast message
        print("Toast button clicked. Scene function called.")
    }
    
    @objc func showProgress() {
        // Your custom logic to show a progress view
        print("Progress button clicked. Scene function called.")
    }
    
    @objc func showAlert() {
        // Your custom logic to show an alert view
        print("Alert button clicked. Scene function called.")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
      
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
      
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
      
    }
    
}


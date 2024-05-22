//
//  SceneDelegate.swift
//  SceneDelegateLearning
//
//  Created by Roro on 21/05/24.
//

import SwiftUI
import UIKit

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var toastViewWindow: UIWindow?
    var progressViewWindow: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("Scene delegate")
        
        let contentView = ContentView()
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
            setUpProgressViewWindow(in: windowScene)
            setUpToastViewWindow(in: windowScene)
        }
    }
    
    func setUpToastViewWindow(in scene: UIWindowScene) {
        let toastViewWindow = PassThroughWindow(windowScene: scene)
        toastViewWindow.windowLevel = UIWindow.Level.alert
        let toastViewController = HostingController(
            rootView: ToastView(showToast: false)
        )
        toastViewController.view.backgroundColor = .clear
        toastViewWindow.rootViewController = toastViewController
        toastViewWindow.isHidden = false
        self.toastViewWindow = toastViewWindow
    }
    
    func setUpProgressViewWindow(in scene: UIWindowScene) {
        let progressViewWindow = PassThroughWindow(windowScene: scene)
        progressViewWindow.windowLevel = UIWindow.Level.alert
        let progressViewController = HostingController(
            rootView: CustomProgressView(showProgress: false)
        )
        progressViewController.view.backgroundColor = .clear
        progressViewWindow.rootViewController = progressViewController
        progressViewWindow.isHidden = false
        self.progressViewWindow = progressViewWindow
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("----- scene delegate -> sceneDidDisconnect")
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("----- scene delegate -> sceneDidBecomeActive")
    }
    func sceneWillResignActive(_ scene: UIScene) {
        print("----- scene delegate -> sceneWillResignActive")
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("----- scene delegate -> sceneWillEnterForeground")
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("----- scene delegate -> sceneDidEnterBackground")
    }
    
}

class PassThroughWindow: UIWindow {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    // Get view from superclass.
    guard let hitView = super.hitTest(point, with: event) else { return nil }
    // If the returned view is the `UIHostingController`'s view, ignore.
    return rootViewController?.view == hitView ? nil : hitView
  }
}

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView: View {
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .darkContent
  }
}

enum NotificationData: String {
    case toastMessage
    case toastDuration
    case progressMessage
    case progressDuration
}

extension Notification.Name {
    static let showToast = Notification.Name("showToast")
    static let showProgress = Notification.Name("showProgress")
}

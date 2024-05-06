//
//  ContentView.swift
//  LocalNotificationsView
//
//  Created by Roro on 03/05/24.
//

import SwiftUI
import UserNotifications
import UIKit

class NotificationsManager {
    static let shared = NotificationsManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error \(error)")
            }
            else {
                print("success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hello there"
        content.body = "I am the notification"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error)
            } else {
                print("success")
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        print(#function)
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Check if the window is set
        guard let window = UIApplication.shared.windows.first else {
            print("Window is not available")
            completionHandler()
            return
        }
        
        let detailView = DetailView()
        let navigationController = UINavigationController(rootViewController: UIHostingController(rootView: detailView))
        
        navigationController.modalPresentationStyle = .fullScreen

        
        if let rootViewController = window.rootViewController {
            rootViewController.present(navigationController, animated: true, completion: nil)
        } else {
            print("Root view controller is nil")
        }

        // Call completion handler
        completionHandler()

        // Print function name
        print(#function)
    }

}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button("Request Authorization") {
                    NotificationsManager.shared.requestAuthorization()
                }
                
                Button("Schedule Notification") {
                    NotificationsManager.shared.scheduleNotification()
                }
                
                NavigationLink {
                    DetailView()
                } label: {
                    Text("Detail View")
                }
                
            }
            .padding()
            .onAppear {
                UNUserNotificationCenter.current().setBadgeCount(0, withCompletionHandler: nil)
            }
            .navigationTitle("Main View")
        }
    }
}

struct DetailView: View {
    var body: some View {
        NavigationView {
            Text("Detail View")
                .navigationTitle("Detail")
        }
    }
}

#Preview {
    ContentView()
}

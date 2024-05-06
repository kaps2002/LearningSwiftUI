//
//  SettingsView.swift
//  FirebaseLearning
//
//  Created by Roro on 06/05/24.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    func logout() throws {
        try AuthManager.shared.signOut()
    }
}

struct SettingsView: View {
    
    @StateObject private var settingsViewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log Out") {
                Task {
                    do {
                        try settingsViewModel.logout()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(false))
    }
}

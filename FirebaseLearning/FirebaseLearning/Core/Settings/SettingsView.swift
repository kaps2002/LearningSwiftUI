//
//  SettingsView.swift
//  FirebaseLearning
//
//  Created by Roro on 06/05/24.
//

import SwiftUI

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
            
            Button("Reset Password") {
                Task {
                    do {
                        try await settingsViewModel.resetPassword()
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Delete Account", role: .destructive) {
                Task {
                    do {
                        try await settingsViewModel.delete()
                        
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

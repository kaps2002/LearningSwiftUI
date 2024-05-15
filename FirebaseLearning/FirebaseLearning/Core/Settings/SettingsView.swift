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
            Button(TextStrings.logout.localized()) {
                Task {
                    do {
                        try settingsViewModel.logout()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button(TextStrings.resetPassword.localized()) {
                Task {
                    do {
                        try await settingsViewModel.resetPassword()
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button(TextStrings.deleteAccount.localized(), role: .destructive) {
                Task {
                    do {
                        try await settingsViewModel.delete()
                        
                    } catch {
                        print(error)
                    }
                }
            }

        }
        .navigationTitle(TextStrings.settings.localized())
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(false))
    }
}

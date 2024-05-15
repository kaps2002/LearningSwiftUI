//
//  ProfileView.swift
//  FirebaseLearning
//
//  Created by Roro on 07/05/24.
//

import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {

    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    func premiumStatus() {
        guard let user else { return }
        
        let currentValue = user.isPremium ?? false
        
        Task {
            try await UserManager.shared.updateUser(user: user, isPremium: !currentValue)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func addUserPreference(text: String) {
        guard let user else { return }

        Task {
            try await UserManager.shared.addUserPreferences(user: user, preference: text)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
}

struct ProfileView: View {
    @StateObject private var languageManager = LanguageManager()

    @Binding var showSignInView: Bool
    @StateObject private var profileViewModel = ProfileViewModel()
    
    var body: some View {
        VStack{
            List {
                if let user = profileViewModel.user {
                    
                    Text(TextStrings.userId.localized() + ": \(user.userId)")
                    
//                    Text("Date: \(user.dateCreated ?? Date())")
                    
                    Text("Email: \(user.email ?? "hello")")
                    
                    Button(action: {
                        profileViewModel.premiumStatus()
                    }, label: {
                        Text(TextStrings.userPremium.localized() + ": \(user.isPremium ?? false)")
                    })
                    
                }
            }
            .listStyle(.plain)
            .task {
                try? await profileViewModel.loadCurrentUser()
            }
            .navigationTitle(TextStrings.profile.localized())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView(showSignInView: $showSignInView), label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.black)
                    })
                }
            }
            HStack {
                Button(action: {
                    languageManager.switchLanguage(to: "de")
                }) {
                    Text("German")
                }
                Button(action: {
                    languageManager.switchLanguage(to: "hi")
                }) {
                    Text("Hindi")
                }
                Button(action: {
                    languageManager.switchLanguage(to: "en")
                }) {
                    Text("English")
                }
            }
        }
        .environment(\.locale, .init(identifier: languageManager.currentLanguage))
    }
}

#Preview {
    NavigationStack {
        ProfileView(showSignInView: .constant(false))
    }
}

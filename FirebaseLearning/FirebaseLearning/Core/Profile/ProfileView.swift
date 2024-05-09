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
    
    @Binding var showSignInView: Bool
    @StateObject private var profileViewModel = ProfileViewModel()
    
    var body: some View {
        List {
            if let user = profileViewModel.user {
                
                Text("UserId: \(user.userId)")
                
                Text("Date: \(user.dateCreated ?? Date())")
                
                Text("Email: \(user.email ?? "hello")")
                
                Button(action: {
                    profileViewModel.premiumStatus()
                }, label: {
                    Text("User Premium: \(user.isPremium ?? false)")
                })
                
                VStack {
                    HStack {
                        Button("Sports") {
                            profileViewModel.addUserPreference(text: "Sports")
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("Movies") {
                            profileViewModel.addUserPreference(text: "Movies")
                        }
                        .buttonStyle(.borderedProminent)

                        Button("Books") {
                            profileViewModel.addUserPreference(text: "Books")
                        }
                        .buttonStyle(.borderedProminent)

                    }
                    
                    Text("User Preferences: \((user.preferences ?? ["heelo"]).joined(separator: ", "))")
                    
                }
                
            }
        }
        .task {
            try? await profileViewModel.loadCurrentUser()
        }
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SettingsView(showSignInView: $showSignInView), label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.black)
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(showSignInView: .constant(false))
    }
}

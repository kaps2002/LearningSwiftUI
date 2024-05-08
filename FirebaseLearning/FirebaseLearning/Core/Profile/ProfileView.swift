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

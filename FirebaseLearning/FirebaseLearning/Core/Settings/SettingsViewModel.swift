//
//  SettingsViewModel.swift
//  FirebaseLearning
//
//  Created by Roro on 07/05/24.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    
    func logout() throws {
        try AuthManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthManager.shared.resetPassword(email: email)
    }
    
    func delete() async throws {
        try await AuthManager.shared.delete()
    }
    
}

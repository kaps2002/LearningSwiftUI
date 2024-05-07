//
//  AuthViewModel.swift
//  FirebaseLearning
//
//  Created by Roro on 07/05/24.
//

import Foundation

import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct GoogleSignInModel {
    let idToken: String
    let accessToken: String
}

@MainActor
final class AuthViewModel: ObservableObject {
    func signInGoogle() async throws {
        guard let topVC = Utilities.shared.getTopViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResponse = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken: String = gidSignInResponse.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSignInResponse.user.accessToken.tokenString
        
        let tokens = GoogleSignInModel(idToken: idToken, accessToken: accessToken)
        
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
        
    }
}

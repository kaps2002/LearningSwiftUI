//
//  SignInEmailViewModel.swift
//  FirebaseLearning
//
//  Created by Roro on 07/05/24.
//

import Foundation

final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email and password")
            return
        }
        let authDataResult = try await AuthManager.shared.createUser(email: email, password: password)
        try await UserManager.shared.createNewUser(auth: authDataResult)

    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email and password")
            return
        }
        let authDataResult = try await AuthManager.shared.signInUser(email: email, password: password)
        try await UserManager.shared.createNewUser(auth: authDataResult)
    }
}

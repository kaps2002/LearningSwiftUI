//
//  AuthView.swift
//  FirebaseLearning
//
//  Created by Roro on 06/05/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct GoogleSignInViewModel {
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
        
        let tokens = GoogleSignInViewModel(idToken: idToken, accessToken: accessToken)
        
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
        
    }
}

struct AuthView: View {
    
    @Binding var showSignInView: Bool
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("SignIn With Email")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                Task {
                    do {
                        try await authViewModel.signInGoogle()
                        showSignInView = false
                    } catch {
                        print(error)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("SignIn")
    }
}

#Preview {
    NavigationStack {
        AuthView(showSignInView: .constant(false))
    }
}

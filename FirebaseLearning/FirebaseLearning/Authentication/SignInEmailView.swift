//
//  SignInEmailView.swift
//  FirebaseLearning
//
//  Created by Roro on 06/05/24.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email and password")
            return
        }
        let _ = try await AuthManager.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email and password")
            return
        }
        let _ = try await AuthManager.shared.signInUser(email: email, password: password)
    }
}

struct SignInEmailView: View {
    
    @StateObject private var signInEmailViewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool

    var body: some View {
        VStack {
            VStack(spacing: 10) {
                TextField("Email...", text: $signInEmailViewModel.email)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                TextField("Password...", text: $signInEmailViewModel.password)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)

                Button(action: {
                    Task {
                        do {
                            try await signInEmailViewModel.signUp()
                            showSignInView = false
                            return
                        } catch {
                            do {
                                try await signInEmailViewModel.signIn()
                                showSignInView = false
                                return
                            } catch {
                                print(error)
                            }
                        }
                    }
                }, label: {
                    Text("Submit")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("SignIn with Email")
    }
}

#Preview {
    NavigationStack {
        SignInEmailView(showSignInView: .constant(false))

    }
}

//
//  LogInView.swift
//  FootballStats
//
//  Created by Roro on 13/06/24.
//

import SwiftUI

struct SignInView: View {
    @State private var loginViewModel = LoginViewModel()
    @State private var isSignUpSheet = false
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Football Stats")
                    .foregroundStyle(.darkBlue)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
            }
            VStack(alignment: .leading, spacing: 15) {
                Text("SignIn")
                    .padding(.horizontal, 15)
                    .font(.title)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(.darkBlue)
                
                EmailFieldView(email: $loginViewModel.email, isEmailValid: $loginViewModel.isEmailValid)
                PasswordFieldView(password: $loginViewModel.password, isPasswordValid: $loginViewModel.isPasswordValid, isSecured: $loginViewModel.isSecured, placeholder: "Your Password")
            }
            
            VStack(spacing: 15) {
                Button(action: {}, label: {
                    Text("SignIn")
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 60)
                        .background(.darkBlue)
                        .clipShape(Capsule())
                })
                HStack(spacing: 4) {
                    Text("Don't have an account yet?")
                    Button(action: {
                        isSignUpSheet = true
                    }, label: {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    })
                }
                .font(.subheadline)
            }
        }
        .sheet(isPresented: $isSignUpSheet, content: {
            SignUpView(isSignUpSheet: $isSignUpSheet)
                .presentationDragIndicator(.visible)
                .presentationDetents([.height(680), .large])
                .presentationCornerRadius(20.0)
        })
    }
}

#Preview {
    SignInView()
}

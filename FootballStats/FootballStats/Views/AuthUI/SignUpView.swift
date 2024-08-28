//
//  SignUpView.swift
//  FootballStats
//
//  Created by Roro on 15/06/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var loginViewModel = LoginViewModel()
    @Binding var isSignUpSheet: Bool
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Spacer()
                Button(action: {
                    isSignUpSheet = false
                }, label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .accentColor(.secondary)
                })
                .padding(.horizontal, 15)
            }
            .padding(.top, 30)
                
            VStack(alignment: .leading, spacing: 15) {
                Image("logo")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.horizontal, 15)

                Text("SignUp")
                    .padding(.horizontal, 15)
                    .font(.title)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(.darkBlue)
                
                VStack {
                    TextField("Your Name", text: $loginViewModel.name)
                        .padding(.horizontal, 15)
                        .frame(height: 45)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(loginViewModel.isNameValid ? Color(.lightGray) : .red),
                            alignment: .bottom
                    )
                    Text(loginViewModel.isNameValid ? "" : "Please Enter your name")
                        .font(.caption)
                        .foregroundStyle(.red)
                }
                .padding(.horizontal, 15)
                
                EmailFieldView(email: $loginViewModel.email, isEmailValid: $loginViewModel.isEmailValid)
                PasswordFieldView(password: $loginViewModel.password, isPasswordValid: $loginViewModel.isPasswordValid, isSecured: $loginViewModel.isSecured, placeholder: "Your Password")
            }
            
            Spacer()
            
            VStack(spacing: 15) {
                Button(action: {}, label: {
                    Text("Sign Up")
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 60)
                        .background(.darkBlue)
                        .clipShape(Capsule())
                })
                HStack(spacing: 4) {
                    Text("Already have an account?")
                    Button(action: {
                        isSignUpSheet = false
                    }, label: {
                        Text("LogIn")
                            .fontWeight(.semibold)
                    })
                }
                .font(.subheadline)
            }
        }
    }
}

#Preview {
    SignUpView(isSignUpSheet: .constant(true))
}

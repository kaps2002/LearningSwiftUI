//
//  ContentView.swift
//  LoginPage
//
//  Created by Roro on 02/04/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isEmailValid = true
    @State private var isPasswordValid = true
    @State private var isSecured = true
    @State private var showingalert = false

    var body: some View {
        VStack(spacing: 70) {
            VStack(alignment: .center, spacing: 5) {
                Text("Welcome Back")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Enter your email and password to log into your Precision Pro Golf Account.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 15)
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10){
                    Text("Email")
                        .fontWeight(.semibold)
                    TextField("", text: $email)
                        .frame(height: 45)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .background(Color("LightGray"))
                        .border(isEmailValid ? Color("LightGray") : Color.red)
                    
                    Text(isEmailValid ? "" : "Please Enter the valid Email Address")
                        .font(.caption)
                        .foregroundStyle(.red)

                }
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Password")
                        .fontWeight(.semibold)
                    ZStack(alignment: .trailing) {
                        Group {
                            if isSecured {
                                SecureField(password, text: $password)

                            } else {
                                TextField(password, text: $password)
                            }
                        }

                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                                .padding()
                        }
                    }
                    .border(isPasswordValid ? Color.clear : Color.red)
                    .frame(height: 45)
                    .background(Color("LightGray"))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    Text(isPasswordValid ? "" : "Password must contains atleast 8 Characters")
                        .font(.caption)
                        .foregroundStyle(.red)

                }
                
                VStack(spacing: 20) {
                    Button("Login") {
                        login()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 60)
                    .background(Color("ButtonColor"))
                    .cornerRadius(50)
                    .alert(isPresented: $showingalert) {
                        Alert(title: Text("Welcome to App"), message: Text("Login Successful"), dismissButton: .default(Text("OK")))
                    }
                    Text("FORGOT PASSWORD?")
                        .underline()
                        .foregroundStyle(.secondary)
                        .fontWeight(.bold)
                        .font(.subheadline)
                }
                .padding(.top, 30)
                
            }
        }
        .padding(.horizontal, 30)
    }
    
    func login() {
        if(!isEmailValid(email)) {
            isEmailValid = false
        }
        else if (password.count < 8){
            isPasswordValid = false
        }
        else {
            showingalert = true
            password = ""
            email = ""
        }
    }
    func isEmailValid (_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@gmail\\.com"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}

#Preview {
    LoginView()
}

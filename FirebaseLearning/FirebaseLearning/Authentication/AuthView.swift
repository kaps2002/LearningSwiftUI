//
//  AuthView.swift
//  FirebaseLearning
//
//  Created by Roro on 06/05/24.
//

import SwiftUI

struct AuthView: View {
    
    @Binding var showSignInView: Bool
    var body: some View {
        VStack {
            NavigationLink{
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("SignIn With Email")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
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

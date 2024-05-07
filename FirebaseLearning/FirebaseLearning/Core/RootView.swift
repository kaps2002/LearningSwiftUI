//
//  RootView.swift
//  FirebaseLearning
//
//  Created by Roro on 06/05/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView = false
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                AuthView(showSignInView: $showSignInView)
            }
        })
    }
}

#Preview {
    RootView()
}

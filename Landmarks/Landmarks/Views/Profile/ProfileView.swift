//
//  ProfileView.swift
//  Landmarks
//
//  Created by Roro on 21/03/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var draftProfile = Profile.default
    
    var body: some View {
        ProfileSummary(profile: draftProfile)
            .padding()
    }
}

#Preview {
    ProfileView()
}

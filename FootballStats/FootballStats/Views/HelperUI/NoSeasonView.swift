//
//  NoSeasonView.swift
//  FootballStats
//
//  Created by Roro on 12/06/24.
//

import SwiftUI

struct NoSeasonView: View {
    var body: some View {
        VStack {
            Text("Sorry this Season do not exist 🥹...")
                .font(.title3)
                .fontWeight(.semibold)
            Text("Try Changing the Season or League ☝️")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NoSeasonView()
}

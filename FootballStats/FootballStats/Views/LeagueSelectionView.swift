//
//  LeagueSelectionView.swift
//  FootballStats
//
//  Created by Roro on 22/04/24.
//

import SwiftUI

struct LeagueSelectionView: View {
    @State private var viewModel = FootballViewModel()
    @State var leagueData: League?
    var body: some View {
        Text("Hello, World!")
            .task {
                viewModel.fetchLeagues()
            }
    }
}

#Preview {
    LeagueSelectionView()
}

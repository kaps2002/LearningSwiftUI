//
//  LeagueSelectionView.swift
//  FootballStats
//
//  Created by Roro on 22/04/24.
//

import SwiftUI

struct LeagueSelectionView: View {
    @State private var viewModel = FootballViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 20) {
                    ForEach(viewModel.leagueData?.data ?? [], id: \.id) { league in
                        NavigationLink {
                            FootballStatsView(uniqueId: league.id)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            LeagueSelectedView(selectedLeague: league)
                        }
                    }
                }
            }
            .padding(10)
            .navigationTitle("Select your League")
            .task {
                viewModel.fetchLeagues()
            }
        }
        
    }
}

#Preview {
    LeagueSelectionView()
}

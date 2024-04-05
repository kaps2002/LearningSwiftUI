//
//  ContentView.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import SwiftUI

struct FootballStatsView: View {
    @State private var viewModel = FootballViewModel()
    var body: some View {
        NavigationView {
            List() {
                ForEach(viewModel.footballmodel?.data.standings ?? [] , id: \.team.id) { teamstanding in
                    FootballStatsRowView(footballstats: teamstanding.team)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Football Stats ⚽️")
        }
        .task {
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    FootballStatsView()
}

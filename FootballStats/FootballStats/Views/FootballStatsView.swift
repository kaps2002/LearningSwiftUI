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
            List {
                ForEach(viewModel.footballmodel?.data.standings ?? [] , id: \.team.id) { teamstanding in
                    NavigationLink {
                        FootballStatsDetailsView(footballstatsdetails: teamstanding.stats, footballstats: teamstanding.team)
                            .padding(.top, -30)
                    } label: {
                        FootballStatsRowView(footballstats: teamstanding.team)
                    }
                }
            }
            .padding(.top, 10)
            .listStyle(.plain)
            .navigationTitle("Football Stats ⚽️")
            .task {
                viewModel.fetchProducts()
            }
        }
        
    }
}

#Preview {
    FootballStatsView()
}

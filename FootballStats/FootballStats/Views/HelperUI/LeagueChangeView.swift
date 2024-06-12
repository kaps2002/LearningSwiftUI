//
//  LeagueChangeView.swift
//  FootballStats
//
//  Created by Roro on 16/05/24.
//

import SwiftUI

struct LeagueChangeView: View {
    @Binding var viewModel: FootballViewModel
    @Binding var uniqueId: String
    @Binding var selectedLeague: String?
    @Binding var selection: String?
    @Binding var lastSelection: String?
    @Binding var isSeasonAvail: Bool

    var body: some View {
        Menu {
            ForEach(viewModel.leagueData?.data ?? [], id: \.id) { league in
                Button {
                    Task {
                        uniqueId = league.id
                        selectedLeague = league.name
                        viewModel.fetchTotalSeasons(uniqueId)
                        viewModel.isLoading = true
                        viewModel.fetchProducts(season: (selection ?? lastSelection) ?? "2023", uniqueId) { response in
                            if response {
                                isSeasonAvail = true
                            } else {
                                isSeasonAvail = false
                            }
                            viewModel.isLoading = false

                        }
                    }
                } label: {
                    HStack {
                        Text(league.name)
                            .foregroundStyle(selectedLeague == league.name ? .blue : .black)
                        if selectedLeague == league.name {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            Text("Choose Leagues")
                .font(.headline)
        }
        .task {
            viewModel.fetchLeagues()
        }
    }
}

#Preview {
    LeagueChangeView(viewModel: .constant(FootballViewModel()), uniqueId: .constant(""), selectedLeague: .constant(""), selection: .constant(""), lastSelection: .constant("2023"), isSeasonAvail: .constant(true))
}

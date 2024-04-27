//
//  ContentView.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import SwiftUI

struct FootballStatsView: View {
    
    @State var footballmodel: FootballModel?
    @State private var viewModel = FootballViewModel()
    @State private var selection: String?
    @State private var lastSelection = UserDefaults.standard.string(forKey: "season")
    @State private var searchTerm = ""

    var uniqueId: String
    
    init(uniqueId: String) {
        self.uniqueId = uniqueId
    }

    var filteredTeams: [TeamStandings] {
        guard  !searchTerm.isEmpty else { return viewModel.footballmodel?.data.standings ?? [] }
        return viewModel.filterTeams(searchTerm: searchTerm, teamStandings: (viewModel.footballmodel?.data.standings)!)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(filteredTeams , id: \.team.id) { teamstanding in
                        NavigationLink {
                            FootballStatsDetailsView(footballstatsdetails: teamstanding.stats, footballstats: teamstanding.team)
                                .padding(.top, -30)
                        } label: {
                            FootballStatsRowView(footballstats: teamstanding.team)
                        }
                    }
                }
                .padding(.top, 50)
                .listStyle(.plain)
                
                VStack(alignment: .center) {
                    HStack {
                        Text("Choose a Season")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                        DropdownView(hint: lastSelection ?? "Select", options: viewModel.leagueSeason?.data.seasons.reversed() ?? [], selection: $selection)
                            .onChange(of: selection) {
                                viewModel.fetchProducts(season: selection!, uniqueId)
                                UserDefaults.standard.setValue(selection!, forKey: "season")
                            }
                    }
                    .padding(.horizontal, 15)
                    Spacer()
                }
            }
            .navigationTitle("Football Stats ⚽️")
            .padding(.top, 10)
            .task {
                viewModel.fetchTotalSeasons(uniqueId)
                viewModel.fetchProducts(season: (selection ?? lastSelection)!, uniqueId)
            }
            .searchable(text: $searchTerm, prompt: "Search your team")
            
        }
    }
}

#Preview {
    FootballStatsView(uniqueId: "eng.1")
}

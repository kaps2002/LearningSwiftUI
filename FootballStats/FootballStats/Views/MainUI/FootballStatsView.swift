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
    @State private var isStarClick = false
    @State private var isSeasonAvail = true
    @State var selectedLeague: String?
    @State var uniqueId: String
    
    init(uniqueId: String, selectedLeague: String?) {
        self.uniqueId = uniqueId
        self.selectedLeague = selectedLeague
    }
    
    var filteredTeams: [TeamStandings] {
        guard  !searchTerm.isEmpty else { return viewModel.footballmodel?.data.standings ?? [] }
        return viewModel.filterTeams(searchTerm: searchTerm, teamStandings: (viewModel.footballmodel?.data.standings)!)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    if isSeasonAvail {
                        List {
                            ForEach(filteredTeams , id: \.team.id) { teamstanding in
                                NavigationLink {
                                    FootballStatsDetailsView(footballstatsdetails: teamstanding.stats, footballstats: teamstanding.team, isStarClick: $isStarClick)
                                        .padding(.top, -30)
                                } label: {
                                    FootballStatsRowView(footballstats: teamstanding.team, isStarClick: $isStarClick)
                                }
                            }
                        }
                        .scrollIndicators(.never)
                        .padding(.top, 50)
                        .listStyle(.plain)
                    } else {
                        NoSeasonView()
                    }
                }
                VStack(alignment: .center) {
                    HStack {
                        Text("Choose a Season")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                        DropdownView(hint: lastSelection ?? "Select", options: viewModel.leagueSeason?.data.seasons.reversed() ?? [], selection: $selection)
                            .onChange(of: selection) {
                                viewModel.isLoading = true
                                viewModel.fetchProducts(season: selection!, uniqueId) { response in
                                    if response {
                                        isSeasonAvail = true
                                    } else {
                                        isSeasonAvail = false
                                    }
                                    viewModel.isLoading = false
                                }
                                UserDefaults.standard.setValue(selection!, forKey: "season")
                            }
                    }
                    .padding(.horizontal, 15)
                    Spacer()
                }
            }
            .navigationTitle("Football Stats ⚽️")
            .padding(.top, 10)
            .searchable(text: $searchTerm, prompt: "Search your team")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    LeagueChangeView(viewModel: $viewModel, uniqueId: $uniqueId, selectedLeague: $selectedLeague, selection: $selection, lastSelection: $lastSelection, isSeasonAvail: $isSeasonAvail)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Settings") {
                            
                        }
                        Button("Logout") {
                            
                        }
                        Button("Delete", role: .destructive) {
                            
                        }
                    } label: {
                        Image(systemName: "person.circle")
                            .foregroundColor(.black)
                            .font(.title)
                            .imageScale(.medium)
                    }
                    .menuStyle(DefaultMenuStyle())
                    
                }
            })
            .task {
                viewModel.fetchTotalSeasons(uniqueId)
                viewModel.fetchSeason(season: ((selection ?? lastSelection) ?? "2023"), uniqueId) { response in
                    viewModel.isLoading = false
                    if response {
                        isSeasonAvail = true
                    } else {
                        isSeasonAvail = false
                    }
                }
            }
        }
    }
}

#Preview {
    FootballStatsView(uniqueId: "eng.1", selectedLeague: "")
}

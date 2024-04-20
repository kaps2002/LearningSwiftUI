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
    private var options: [String] = ["2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"]
    
    @State private var lastSelection = UserDefaults.standard.string(forKey: "season")
    @State private var searchTerm = ""
    
    
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
                        DropdownView(hint: lastSelection ?? "Select", options: options, selection: $selection)
                            .onChange(of: selection) {
                                viewModel.fetchSeason(forSeason: selection!)
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
                viewModel.fetchSeason(forSeason: (selection ?? lastSelection)!)
            }
            .searchable(text: $searchTerm, prompt: "Search your team")
            
        }
    }
}

#Preview {
    FootballStatsView()
}

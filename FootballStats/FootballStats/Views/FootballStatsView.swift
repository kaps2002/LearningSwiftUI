//
//  ContentView.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import SwiftUI

struct FootballStatsView: View {
    @State private var viewModel = FootballViewModel()
    @State private var selection: String?
    private var options: [String] = ["2015","2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"]
    var body: some View {
        NavigationView {
            ZStack {
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
                .padding(.top, 50)
                .listStyle(.plain)
                
                VStack(alignment: .center) {
                    HStack {
                        Text("Choose a Season")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        DropdownView(hint: "Select", options: options, selection: $selection)
                            .onChange(of: selection) {
                                viewModel.fetchProducts(season: selection!)
                            }
                    }
                    .padding(.horizontal, 15)
                    Spacer()
                }
                
                
            }
            .navigationTitle("Football Stats ⚽️")
            .padding(.top, 10)
            .task {
                viewModel.fetchProducts(season: selection ?? "2020")
            }
            
        }
        
    }
}

#Preview {
    FootballStatsView()
}

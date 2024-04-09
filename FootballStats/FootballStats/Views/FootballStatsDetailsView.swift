//
//  FootballStatsDetailsView.swift
//  FootballStats
//
//  Created by Roro on 05/04/24.
//

import SwiftUI

struct FootballStatsDetailsView: View {
    
    @State private var viewModel = FootballViewModel()
    @State var footballstatsdetails = FootballModel.sample.data.standings.first?.stats
    @State var footballstats = FootballModel.sample.data.standings.first?.team
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                AsyncImageView(footballTeamImg: footballstats!.logos.first?.href ?? "")
                    .frame(width: 150, height: 150)
                HStack {
                    Text(footballstats!.name)
                        .fontWeight(.semibold)
                        .font(.title2)
                    Text("(\(footballstats!.abbreviation))")
                        .font(.headline)
                    
                }
                Text(String(footballstats!.location.components(separatedBy: " ").first!))
                    .foregroundStyle(.secondary)
                
            }
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Description")
                        Image(systemName: "note.text")
                            .resizable()
                            .frame(width: 22, height: 22)
                    }
                    .font(.title)
                    .fontWeight(.bold)
                    
                    Text(compare(viewModel.descArray, footballstats!))
                        .font(.system(size: 17))
                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                
                VStack(alignment: .leading) {
                    Text("Season Stats")
                        .padding(.horizontal, 20)
                        .font(.title)
                        .fontWeight(.bold)
                    FootballStatsTableView(footballstatsdetails: footballstatsdetails!)
                        .padding(.top, -20)
                }
            }
        }
    }
    
    func compare(_ description: [Description], _ footballstats: Team) -> String {
        for desc in viewModel.descArray {
            if(desc.abb == footballstats.abbreviation) {
                return desc.desc
            }
        }
        return ""
    }
    
    
}

#Preview {
    FootballStatsDetailsView(footballstats: FootballModel.sample.data.standings.first!.team)
}

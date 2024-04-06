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
                            .frame(width: 25, height: 25)
                    }
                    .padding(.bottom, 10)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                    Text("Manchester City Football Club is a professional football club based in Manchester, England, that competes in the Premier League, the top flight of English football. Founded in 1880 as St. Mark's, they became Ardwick Association Football Club in 1887 and Manchester City in 1894.")
                        .fontDesign(.rounded)
                        .font(.headline)
                }
                .padding(.horizontal, 20)
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Season Stats")
                        .padding(.horizontal, 20)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    FootballStatsTableView(footballstatsdetails: footballstatsdetails!)
                        
                }
                
                .padding(.top, 20)
            }
            .padding(.top, 20)
            Spacer()
        }
    }
}


#Preview {
    FootballStatsDetailsView(footballstats: FootballModel.sample.data.standings.first!.team)
}

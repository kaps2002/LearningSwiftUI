//
//  FootballStatsDetailsView.swift
//  FootballStats
//
//  Created by Roro on 05/04/24.
//

import SwiftUI

struct FootballStatsDetailsView: View {
    @State private var viewModel = FootballViewModel()
    var footballstats = FootballModel.sample.data.standings.first?.team
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
            Spacer()
            VStack {
                Text(footballstats!.name + " Stats")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                FootballStatsTableView()
                    
            }
            .padding(.top, 50)
            Spacer()
        }
    }
}


#Preview {
    FootballStatsDetailsView()
}

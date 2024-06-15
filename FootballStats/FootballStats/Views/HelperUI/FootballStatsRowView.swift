//
//  FootballStatsRowView.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import SwiftUI

struct FootballStatsRowView: View {
    @State private var viewModel = FootballViewModel()
    @State var footballstats = FootballModel.sample.data.standings.first?.team
    @Binding var isStarClick: Bool
    
    var body: some View {
        HStack {
            AsyncImageView(footballTeamImg: footballstats!.logos?.first?.href ?? "https://secure.espncdn.com/combiner/i?img=/i/teamlogos/default-team-logo-500.png&h=72&w=72")
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(footballstats!.name)
                        .fontWeight(.semibold)
                    Text("(\(footballstats!.abbreviation))")
                        .font(.subheadline)
                    
                }
                Text("Home: \(String(footballstats!.location.components(separatedBy: " ").first!))")
                        .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .imageScale(.small)
                .padding(.horizontal, 15)
        }
    }
}

#Preview {
    FootballStatsRowView(isStarClick: .constant(false))
}

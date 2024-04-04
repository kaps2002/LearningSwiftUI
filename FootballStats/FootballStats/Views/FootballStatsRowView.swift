//
//  FootballStatsRowView.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import SwiftUI

struct FootballStatsRowView: View {
    
    let footballstats: FootballModel
    var body: some View {
        HStack {
            AsyncImageView(footballTeamImg: FootballModel.sample.data.standings.first?.team.logos.first?.href ?? "")
                .frame(width: 70, height: 70)
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Text(FootballModel.sample.data.name)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(String(FootballModel.sample.data.seasonDisplay))
                        .foregroundStyle(.secondary)
                }
                Text(FootballModel.sample.data.standings.first?.team.name ?? "")
            }
        }
        .padding()
        
    }
}

#Preview {
    FootballStatsRowView(footballstats: FootballModel.sample)
}

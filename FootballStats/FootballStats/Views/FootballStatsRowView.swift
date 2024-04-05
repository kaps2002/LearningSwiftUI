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
    var body: some View {
        HStack {
            AsyncImageView(footballTeamImg: footballstats!.logos.first?.href ?? "")
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(footballstats!.name)
                        .fontWeight(.semibold)
                    Text("(\(footballstats!.abbreviation))")
                        .font(.subheadline)

                }
                Text("City: \(String(footballstats!.location.components(separatedBy: " ").first!))")
                        .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    FootballStatsRowView()
}

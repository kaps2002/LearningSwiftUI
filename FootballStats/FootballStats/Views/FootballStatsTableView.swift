//
//  FootballStatsTableView.swift
//  FootballStats
//
//  Created by Roro on 05/04/24.
//

import SwiftUI

struct FootballStatsTableView: View {
    @State var footballstatsdetails = FootballModel.sample.data.standings.first?.stats

    var body: some View {
        List {
            ForEach(footballstatsdetails!, id: \.abbreviation) { teamStatsDetails in
                HStack {
                    Text(teamStatsDetails.displayName)
                    Text("(\(teamStatsDetails.abbreviation))")
                    Spacer()
                    Text(teamStatsDetails.displayValue)
                }
                
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    FootballStatsTableView()
}

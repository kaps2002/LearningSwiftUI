//
//  FootballStatsTableView.swift
//  FootballStats
//
//  Created by Roro on 05/04/24.
//

import SwiftUI

struct FootballStatsTableView: View {
    
    @State var footballstatsdetails: [TeamStats]

    var body: some View {
        List {
            ForEach(footballstatsdetails, id: \.abbreviation) { teamStatsDetail in
                HStack {
                    Text(teamStatsDetail.displayName)
                    Text("(\(teamStatsDetail.abbreviation))")
                    Spacer()
                    Group {
                        if teamStatsDetail.displayValue == "" {
                            Text("0")

                        } else {
                            Text(teamStatsDetail.displayValue)
                        }
                    }
                }
                .font(.system(size: 17))
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    FootballStatsTableView(footballstatsdetails: FootballModel.sample.data.standings.first?.stats ?? [])
}

//
//  LeagueSelectedView.swift
//  FootballStats
//
//  Created by Roro on 22/04/24.
//

import SwiftUI

struct LeagueSelectedView: View {
    @State var selectedLeague = League.sampleLeague.data.first
    var body: some View {
        VStack(alignment: .center) {
            AsyncImageView(footballTeamImg: selectedLeague?.logos.light ?? "")
                .frame(width: 100, height: 100)
            Text(selectedLeague?.name ?? "")
                .font(.system(size: 16))
                .fontWeight(.bold)
        }

    }
}

#Preview {
    LeagueSelectedView()
}

//
//  AsyncImageView.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import SwiftUI

struct AsyncImageView: View {
    let footballTeamImg: String

    var body: some View {
        if let url = URL(string: footballTeamImg) {
                footballTeamImage(url)
            }
        }
        func footballTeamImage(_ url: URL) -> some View {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
}

#Preview {
    AsyncImageView(footballTeamImg: FootballModel.sample.data.standings.first?.team.logos.first?.href ?? "")
}

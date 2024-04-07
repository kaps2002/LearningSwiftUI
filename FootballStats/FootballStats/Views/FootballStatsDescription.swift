//
//  FootballStatsDescription.swift
//  FootballStats
//
//  Created by Roro on 07/04/24.
//

import SwiftUI

struct FootballStatsDescription: View {
    @State var description: Description
    
    var body: some View {
        Text(description.desc)
            .fontDesign(.rounded)
            .font(.headline)
    }
}

#Preview {
    FootballStatsDescription(description: FootballModel.sampledesc)
}

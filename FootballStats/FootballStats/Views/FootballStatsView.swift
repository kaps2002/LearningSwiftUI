//
//  ContentView.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import SwiftUI

struct FootballStatsView: View {
    @State private var viewModel = FootballViewModel()
    
    var body: some View {
        NavigationView {
            FootballStatsRowView(footballstats: FootballModel.sample)
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}


#Preview {
    FootballStatsView()
}

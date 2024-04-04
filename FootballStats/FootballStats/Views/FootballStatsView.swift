//
//  ContentView.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import SwiftUI

struct FootballStatsView: View {
    @StateObject private var viewModel = FootballViewModel()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                Text("heelo")
            } else if let footballdata = viewModel.footballdata {
                VStack {
                    Text("League: \(FootballModel.sample.data.name), Season: \(FootballModel.sample.data.seasonDisplay)")
                }
                
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundStyle(.red)
            } else {
                Text("No data Available")
            }
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    FootballStatsView()
}

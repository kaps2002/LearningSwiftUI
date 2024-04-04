//
//  FootballViewModel.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import Foundation


class FootballViewModel: ObservableObject {
    
    @Published var footballdata: FootballModel?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    func fetchProducts() {
        self.isLoading = true
        self.errorMessage = nil
        APIManager.shared.request(from: "https://api-football-standings.azharimm.dev/leagues/eng.1/standings?season=2020&sort=asc") { [self] result in
            self.isLoading = false
            switch result {
                
            case .success(let leagueResponse):
                self.footballdata = leagueResponse
                print(footballdata ?? "")
            case .failure(let error):
                print(error)
            }
        }
            
    }
}

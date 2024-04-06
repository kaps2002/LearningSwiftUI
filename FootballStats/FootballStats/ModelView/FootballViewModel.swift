//
//  FootballViewModel.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import Foundation

@Observable
class FootballViewModel {
    
    var footballmodel: FootballModel?

    func fetchProducts() {
        APIManager.shared.request(from: "https://api-football-standings.azharimm.dev/leagues/eng.1/standings?season=2020") { [self] result in
            switch result {
            case .success(let leagueResponse):
                self.footballmodel = leagueResponse
                print(footballmodel!)
            case .failure(let error):
                print(error)
            }
        }
    }
}

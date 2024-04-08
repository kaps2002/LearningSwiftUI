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
    var descArray = [Description]()
    
    init(){
        load()
    }
    
    func fetchProducts(season: String) {
        print(season)
        APIManager.shared.request(from: "https://api-football-standings.azharimm.dev/leagues/eng.1/standings?season=\(season)&sort=asc") { [self] result in
            switch result {
            case .success(let leagueResponse):
                self.footballmodel = leagueResponse
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func load()  {
        guard let file = Bundle.main.url(forResource: "Description", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: file)
        let descArray = try? JSONDecoder().decode([Description].self, from: data!)
        self.descArray = descArray!
    }
}

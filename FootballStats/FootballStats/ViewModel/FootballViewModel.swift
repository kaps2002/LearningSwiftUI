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
    
    func fetchSeason(forSeason season: String) {
        if(season == "2023") {
            fetchProducts(season: season)
        }
        else if let savedSeasonData = UserDefaultsManager.shared.getSeasonData(forSeason: season) {
            self.footballmodel = savedSeasonData
        } else {
            fetchProducts(season: season)
        }
    }
    
    func fetchProducts(season: String) {
        APIManager.shared.request(from: "https://api-football-standings.azharimm.dev/leagues/eng.1/standings?season=\(season)&sort=asc") { [self] result in
            switch result {
            case .success(let leagueResponse):
                self.footballmodel = leagueResponse
                if (season != "2023") {
                    UserDefaultsManager.shared.saveSeasonData(footballmodel!, forSeason: season)
                }
                UserDefaults.standard.set(season, forKey: "season")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func load() {
        guard let file = Bundle.main.url(forResource: "Description", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        let data = try? Data(contentsOf: file)
        let descArray = try? JSONDecoder().decode([Description].self, from: data!)
        self.descArray = descArray!
    }
    
    func filterTeams(searchTerm: String, teamStandings: [TeamStandings]) -> [TeamStandings] {
        teamStandings.filter {
            $0.team.name.localizedStandardContains(filterSearchTerm(searchTerm))
        }
    }
    
    func filterSearchTerm(_ searchTerm: String) -> String {
        let searchArray = searchTerm.split(separator: " ")
        var newSearchTerm = ""
        for index in 0..<searchArray.count {
            if (index != searchArray.count - 1) { newSearchTerm += searchArray[index] + " " }
            else {
                newSearchTerm += searchArray[index]
            }

        }
        return newSearchTerm
    }
}

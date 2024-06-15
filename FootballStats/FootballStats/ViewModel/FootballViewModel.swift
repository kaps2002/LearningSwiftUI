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
    var leagueData: League?
    var leagueSeason: LeagueSeasons?
    var isLoading = false
    var isDark: Bool = false
    
    init(){
        load()
    }
    
    func fetchSeason(season: String, _ uniqueId: String, completion: @escaping (Bool) -> Void) {
        if(season == "2023") {
            fetchProducts(season: season, uniqueId) { response in
                if response {
                    completion(true)
                } else {
                    completion(false)

                }
            }
        }
        else if let savedSeasonData = UserDefaultsManager.shared.getSeasonData(forSeason: season, uniqueId) {
            self.footballmodel = savedSeasonData
        } else {
            fetchProducts(season: season, uniqueId) { response in
                if response {
                    completion(true)
                } else {
                    completion(false)

                }
            }
        }
    }
    
    func fetchLeagues() {
        APIManager.shared.requestLeagues(from: "https://api-football-standings.azharimm.dev/leagues") { [self] result in
            switch result {
            case .success(let leagueData):
                self.leagueData = leagueData
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchProducts(season: String, _ uniqueId: String, completion: @escaping (Bool) -> Void) {
        APIManager.shared.request(from: "https://api-football-standings.azharimm.dev/leagues/\(uniqueId)/standings?season=\(season)&sort=asc") { [self] result in
            switch result {
            case .success(let leagueResponse):
                self.footballmodel = leagueResponse
                if (season != "2023") {
                    UserDefaultsManager.shared.saveSeasonData(footballmodel!, forSeason: season, uniqueId)
                }
                UserDefaults.standard.set(season, forKey: "season")
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
    func fetchTotalSeasons(_ uniqueId: String) {
        APIManager.shared.requestSeasons(from: "https://api-football-standings.azharimm.dev/leagues/\(uniqueId)/seasons") { [self] result in
            switch result {
            case .success(let seasonResponse):
                self.leagueSeason = seasonResponse
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

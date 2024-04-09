//
//  UserDefaultsMangaer.swift
//  FootballStats
//
//  Created by Roro on 09/04/24.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    func saveSeasonData(_ data: FootballModel, forSeason season: String) {
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: "seasonData_\(season)")
        }
    }
    
    func getSeasonData(forSeason season: String) -> FootballModel? {
        if let savedData = UserDefaults.standard.data(forKey: "seasonData_\(season)") {
            if let decodedData = try? JSONDecoder().decode(FootballModel.self, from: savedData) {
                print("UserDefaults is called")
                return decodedData
            }
        }
        return nil
    }
    
    
}

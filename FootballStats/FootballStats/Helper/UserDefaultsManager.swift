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
    
    func saveSeasonData(_ data: FootballModel, forSeason season: String, _ uniqueId: String) {
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encodedData, forKey: "seasonData_\(season + uniqueId)")
        }
    }
    
    func getSeasonData(forSeason season: String, _ uniqueId: String) -> FootballModel? {
        if let savedData = UserDefaults.standard.data(forKey: "seasonData_\(season + uniqueId)") {
            if let decodedData = try? JSONDecoder().decode(FootballModel.self, from: savedData) {
                return decodedData
            }
        }
        return nil
    }
    
    
}

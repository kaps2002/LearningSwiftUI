//
//  APIManager.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func request(from url: String, completion: @escaping (Result<FootballModel, Error>) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let leagueTeams = try JSONDecoder().decode(FootballModel.self, from: data)
                    completion(.success(leagueTeams))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestLeagues(from url: String, completion: @escaping (Result<League, Error>) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let leagueData = try JSONDecoder().decode(League.self, from: data)
                    completion(.success(leagueData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestSeasons(from url: String, completion: @escaping (Result<LeagueSeasons, Error>) -> Void) {
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let seasonData = try JSONDecoder().decode(LeagueSeasons.self, from: data)
                    completion(.success(seasonData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

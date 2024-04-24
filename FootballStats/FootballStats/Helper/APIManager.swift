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
                print(data)
                do {
                    let leagueTeams = try JSONDecoder().decode(FootballModel.self, from: data)
                    print(leagueTeams)
                    completion(.success(leagueTeams))
                } catch {
                    if let decodingError = error as? DecodingError {
                        switch decodingError {
                        case .keyNotFound(let key, let context):
                            print("Key not found: \(key.stringValue)")
                            print("Context: \(context.debugDescription)")
                            // Handle the key not found error
                        case .typeMismatch(let type, let context):
                            print("Type mismatch: \(type)")
                            print("Context: \(context.debugDescription)")
                            // Handle the type mismatch error
                        case .valueNotFound(let type, let context):
                            print("Value not found for type: \(type)")
                            print("Context: \(context.debugDescription)")
                            // Handle the value not found error
                        case .dataCorrupted(let context):
                            print("Data corrupted")
                            print("Context: \(context.debugDescription)")
                            // Handle the data corrupted error
                        @unknown default:
                            print("Unknown decoding error")
                            // Handle unknown decoding errors
                        }
                        completion(.failure(error))
                    }
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
}

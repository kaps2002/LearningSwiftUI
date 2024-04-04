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
        AF.request(url).responseData{ response in
            switch response.result {
            case .success(let data):
                do {
                    let leagueData = try JSONDecoder().decode(FootballModel.self, from: data)
                    
                    completion(.success(leagueData))
                    print(leagueData)
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

//
//  APIManager.swift
//  MVVMProduct
//
//  Created by Roro on 28/03/24.
//

import Foundation
import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidDecoding
    case invalidData
    case message(_ error: Error?)
}

//Singleeton Design Pattern
// final keyword means inheritance not possible in other SubClass
final class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func fetchProducts(completion: @escaping (Result<[Product], DataError>) -> Void) {
        guard let url = URL(string: Constant.API.productURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode
            else {
                completion(.failure(.invalidResponse))
                return
            }
            
            //JSONDecoder converts the data to model of array.
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.message(error)))

            }

        }.resume()
                
    }
    
}

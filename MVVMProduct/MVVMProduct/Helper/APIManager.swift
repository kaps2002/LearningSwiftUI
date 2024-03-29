//
//  APIManager.swift
//  MVVMProduct
//
//  Created by Roro on 28/03/24.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
}

// final keyword means inheritance not possible in other SubClass
final class APIManager {
    
    func request<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: Constant.API.productURL) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidURL
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    
}

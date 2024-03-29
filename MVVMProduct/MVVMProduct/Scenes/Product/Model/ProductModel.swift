//
//  ProductModel.swift
//  MVVMProduct
//
//  Created by Roro on 28/03/24.
//

import Foundation

struct ProductModel: Identifiable, Decodable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    struct Rating: Decodable {
        let rate: Float
        let count: Int
    }
}

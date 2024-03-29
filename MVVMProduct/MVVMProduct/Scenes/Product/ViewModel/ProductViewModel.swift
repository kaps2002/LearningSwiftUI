//
//  ProductViewModel.swift
//  MVVMProduct
//
//  Created by Roro on 28/03/24.
//

import Foundation

final class ProductViewModel {
    
    var products: [ProductModel] = []
    private let manager = APIManager()

    func fetchProducts() async {
        
        do {
            let responseProducts: [ProductModel] = try await manager.request(url: Constant.API.productURL)
            print(responseProducts)
        } catch {
            print(error)
        }
    }
}

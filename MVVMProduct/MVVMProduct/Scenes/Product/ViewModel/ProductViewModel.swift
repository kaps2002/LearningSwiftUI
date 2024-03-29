//
//  ProductViewModel.swift
//  MVVMProduct
//
//  Created by Roro on 28/03/24.
//

import Foundation

@Observable
class ProductViewModel {
    
    var products: [ProductModel] = []
    private let manager = APIManager()

    func fetchProducts() async {
        
        do {
            products = try await manager.request(url: Constant.API.productURL)
            print(products)
        } catch {
            print(error)
        }
    }
}

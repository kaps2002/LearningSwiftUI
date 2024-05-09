//
//  ProductViewModel.swift
//  FirebaseLearning
//
//  Created by Roro on 09/05/24.
//

import Foundation

@MainActor
final class ProductViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    
    func downloadProductsAndUploadtoFirebase() {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let products = try JSONDecoder().decode(ProductArray.self, from: data)
                let productArray = products.products
                
                for product in productArray {
                    try? await ProductManager.shared.uploadProduct(product: product)
                }
                
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    func getAllProducts() async throws {
        self.products = try await ProductManager.shared.getAllProducts()
    }
}

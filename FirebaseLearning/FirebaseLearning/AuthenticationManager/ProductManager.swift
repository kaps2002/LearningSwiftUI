//
//  ProductManager.swift
//  FirebaseLearning
//
//  Created by Roro on 09/05/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ProductManager {
    static let shared = ProductManager()
    
    private init() {}
    
    private let productsCollection = Firestore.firestore().collection("products")
    
    private func productDocument(productId: String) -> DocumentReference {
        productsCollection.document(productId)
    }
    
    func uploadProduct(product: Product) async throws {
        try productDocument(productId: String(product.id)).setData(from: product, merge: false)
    }
    
    func getAllProducts() async throws -> [Product] {
        let snapshot = try await productsCollection.getDocuments()
        
        var products: [Product] = []
        
        for document in snapshot.documents {
            let product = try document.data(as: Product.self)
            products.append(product)
        }
        
        return products
    }
    
    private func getAllProductsSortedbyPrice(descending: Bool) async throws -> [Product] {
        try await productsCollection.order(by: "price", descending: descending).getDocuments(as: Product.self)
    }
    
    private func getAllProductsByCategory(category: String) async throws -> [Product] {
        try await productsCollection.whereField("category", isEqualTo: category).getDocuments(as: Product.self)
    }
    
    private func getAllProductsByCategoryAndSort(descending: Bool, category: String) async throws -> [Product] {
        try await productsCollection
            .whereField("category", isEqualTo: category)
            .order(by: "price", descending: descending)
            .getDocuments(as: Product.self)
    }
    
    func getAllProductsByCategoryAndSort(descending: Bool?, category: String?) async throws -> [Product] {
        if let descending, let category {
            return try await getAllProductsByCategoryAndSort(descending: descending, category: category)
        } else if let descending {
            return try await getAllProductsSortedbyPrice(descending: descending)
        } else if let category {
            return try await getAllProductsByCategory(category: category)
        }
        
        return try await getAllProducts()
        
    }
}

extension Query {
    func getDocuments<T>(as type: T.Type) async throws -> [T] where T : Decodable {
        let snapshot = try await self.getDocuments()
        
        return try snapshot.documents.map({ document in
            try document.data(as: T.self)
        })
    }
}

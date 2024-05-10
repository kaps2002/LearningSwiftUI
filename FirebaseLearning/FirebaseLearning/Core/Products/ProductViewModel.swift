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
    @Published var selectedFilter: FilterOption? = nil
    @Published var selectedCategory: CategoryOption? = nil

    
    enum FilterOption: String, CaseIterable {
        case priceHigh = "High to Low"
        case priceLow = "Low to High"
        case none = "None"
        
        var priceOption: Bool? {
            switch self {
            case .priceLow: return false
            case .priceHigh: return true
            case .none: return nil
            }
        }
    }
    
    enum CategoryOption: String, CaseIterable {
        case none = "None"
        case smartphones = "smartphones"
        case laptops = "laptops"
        case fragrances = "fragrances"
        case groceries = "groceries"
        case skincare = "skincare"
        case homedecor = "home-decoration"
        
        var categoryKey: String? {
            if self == .none {
                return nil
            }
            return self.rawValue
        }
    }
    
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
    
//    func getAllProducts() async throws {
//        self.products = try await ProductManager.shared.getAllProducts()
//    }
    
    func getFilterSelected(option: FilterOption) async throws {
        self.selectedFilter = option
        self.getProducts()
//        switch option {
//        case .priceLow: 
//            self.products = try await ProductManager.shared.getAllProductsSortedbyPrice(descending: false)
//        case .priceHigh:
//            self.products = try await ProductManager.shared.getAllProductsSortedbyPrice(descending: true)
//        case .none:
//            self.products = try await ProductManager.shared.getAllProducts()
//        }
        
    }
    
    func getCategorySelected(option: CategoryOption) async throws {
        self.selectedCategory = option

//        switch option {
//        case .laptops, .smartphones, .fragrances, .groceries, .skincare, .homedecor:
//            self.products = try await ProductManager.shared.getAllProductsByCategory(category: option.rawValue)
//        case .none:
//            self.products = try await ProductManager.shared.getAllProducts()
//        }
        self.getProducts()
        
    }
    
    func getProducts() {
        Task {
            self.products = try await ProductManager.shared.getAllProductsByCategoryAndSort(descending: selectedFilter?.priceOption, category: selectedCategory?.categoryKey)
        }
    }
}

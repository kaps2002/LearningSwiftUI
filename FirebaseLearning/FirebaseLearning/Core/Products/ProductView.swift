//
//  ProductView.swift
//  FirebaseLearning
//
//  Created by Roro on 09/05/24.
//

import SwiftUI

struct ProductView: View {
    @StateObject private var productViewModel = ProductViewModel()
    
    var body: some View {
        List {
            ForEach(productViewModel.products) { product in
                HStack(spacing: 20) {
                    AsyncImage(url: URL(string: product.thumbnail ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .cornerRadius(10.0)
                        
                    } placeholder: {
                         ProgressView()
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(product.title?.capitalized ?? "")
                            Text("$" + String(product.price ?? 10))
                            Text(product.category?.capitalized ?? "")
                            HStack(spacing: 3) {
                                Text("Rating: ")
                                StarView(rating: product.rating ?? 5.0)
                            }
                        }
                        Spacer()
                        
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Products")
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Menu("Filter: \(productViewModel.selectedFilter?.rawValue ?? "None")") {
                    ForEach(ProductViewModel.FilterOption.allCases, id: \.self) { filterOption in
                        Button(filterOption.rawValue) {
                            Task{
                                try await productViewModel.getFilterSelected(option: filterOption)
                            }
                        }
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu("Category: \(productViewModel.selectedCategory?.rawValue.capitalized ?? "None")") {
                    ForEach(ProductViewModel.CategoryOption.allCases, id: \.self) { categoryOption in
                        Button(categoryOption.rawValue.capitalized) {
                            Task{
                                try await productViewModel.getCategorySelected(option: categoryOption)
                            }
                        }
                    }
                }
            }

        })
        .task {
            productViewModel.getProducts()
        }
    }
}

#Preview {
    NavigationStack{
        ProductView()
    }
}

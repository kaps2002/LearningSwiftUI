//
//  CategoryMenuView.swift
//  FirebaseLearning
//
//  Created by Roro on 13/05/24.
//

import SwiftUI

struct CategoryMenuView: View {
    @ObservedObject var productViewModel: ProductViewModel
        
        var body: some View {
            Menu("Category: \(productViewModel.selectedCategory?.rawValue.capitalized ?? "None")") {
                ForEach(ProductViewModel.CategoryOption.allCases, id: \.self) { categoryOption in
                    Button(categoryOption.rawValue.capitalized) {
                        Task {
                            try await productViewModel.getCategorySelected(option: categoryOption)
                        }
                    }
                }
            }
        }
}

#Preview {
    CategoryMenuView(productViewModel: ProductViewModel())
}

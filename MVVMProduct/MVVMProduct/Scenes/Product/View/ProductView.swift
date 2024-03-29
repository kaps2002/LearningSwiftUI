//
//  ContentView.swift
//  MVVMProduct
//
//  Created by Roro on 28/03/24.
//

import SwiftUI

struct ProductView: View {
    @State private var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                ProductRowView(product: product)
            }
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProducts()
        }
        
    }
}

#Preview {
    ProductView()
}

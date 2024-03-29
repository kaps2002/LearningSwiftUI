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
            List {
                ForEach (viewModel.products) { product in
                    NavigationLink {
                        ProductDetails(product: product)
                    } label : {
                        ProductRowView(product: product)
                    }
                }
            }
            .listStyle(.inset)
            
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

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
        ZStack {
            List {
                ForEach(productViewModel.products) { product in
                    Text(product.title ?? "N/a")
                }
                
            }
            .listStyle(.plain)
            .task {
                try? await productViewModel.getAllProducts()
            }
        }
        .navigationTitle("Products")
        
    }
}

#Preview {
    NavigationStack{
        ProductView()

    }
}

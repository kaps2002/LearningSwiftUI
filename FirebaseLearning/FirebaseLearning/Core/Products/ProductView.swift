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
                        }
                        Spacer()
                        Text(String(product.rating ?? 1.0) +  " ⭐️")
                    }
                }
            }
        }
        .listStyle(.plain)
        .task {
            try? await productViewModel.getAllProducts()
        }
        .navigationTitle("Products")
        
    }
}

#Preview {
    NavigationStack{
        ProductView()
    }
}

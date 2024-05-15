//
//  ProductView.swift
//  FirebaseLearning
//
//  Created by Roro on 09/05/24.
//

import SwiftUI

struct ProductView: View {
    
    @StateObject private var productViewModel = ProductViewModel()
    
    @State private var defaultImg: String = "https://secure.espncdn.com/combiner/i?img=/i/teamlogos/default-team-logo-500.png"
    var body: some View {
        List {
            ForEach(productViewModel.products) { product in
                HStack(spacing: 20) {
                    AsyncImage(url: URL(string: product.thumbnail ?? defaultImg)) { image in
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
                                Text(TextStrings.rating.localized())
                                StarView(rating: product.rating ?? 5.0)
                            }
                        }
                        Spacer()
                        
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(TextStrings.products.localized())
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                FilterMenuView(productViewModel: productViewModel)

            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                CategoryMenuView(productViewModel: productViewModel)
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

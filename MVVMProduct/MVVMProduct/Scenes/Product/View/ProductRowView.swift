//
//  ProductRowView.swift
//  MVVMProduct
//
//  Created by Roro on 29/03/24.
//

import SwiftUI

struct ProductRowView: View {
    let product: ProductModel
    var body: some View {
        HStack {
            if let url = URL(string: product.image) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(product.category)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        
    }
}

#Preview {
    ProductRowView(product: ProductModel.sample)
}

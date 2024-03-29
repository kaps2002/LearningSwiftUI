//
//  ProductRowView.swift
//  MVVMProduct
//
//  Created by Roro on 29/03/24.
//

import SwiftUI

struct ProductRowView: View {

    var body: some View {
        HStack {
            if let url = URL(string: ProductModel.sample.image) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 150)
            }
            VStack(alignment: .leading) {
                Text(ProductModel.sample.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(ProductModel.sample.category)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        
    }
}

#Preview {
    ProductRowView()
}

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
            AsyncImageView(productImage: product.image)
                .frame(width: 100, height: 100)

            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                HStack {
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.yellow)
                    Text(String(product.rating.rate))
                        .fontWeight(.bold)
                        .foregroundStyle(.yellow)
                }
                
                VStack(alignment: .leading) {
                    Text(product.description)
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                    HStack {
                        Text("\u{20B9} \(String(product.price))")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {}, label: {
                            Text("Buy")
                                .foregroundStyle(.white)
                                .frame(width: 50, height: 25)
                                .background(.blue)
                                .cornerRadius(15)
                        })
                    }
                }
                
            }
        }
    }
    
    
}

#Preview {
    ProductRowView(product: ProductModel.sample)
}

//
//  ProductDetails.swift
//  MVVMProduct
//
//  Created by Roro on 29/03/24.
//

import SwiftUI

struct ProductDetails: View {
    let product: ProductModel
    var body: some View {
        VStack {
            AsyncImageView(productImage: product.image)
                .frame(width: 300, height: 300)
                .padding()
            Text(product.title)
                .fontWeight(.bold)
                .font(.title3)
            Text(product.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            HStack(spacing: 25) { // Adjust the spacing value as needed
                HStack {
                    Image(systemName: "star.fill")
                    Text(String(product.rating.rate) + " Ratings")
                }
                .foregroundColor(.yellow)
                
                Text(String((product.rating.count * product.rating.rate) / 100) + " Reviews")
                    .foregroundStyle(.secondary)
                
                Text(String((product.rating.count * product.rating.rate) / 100) + " Sold")         .foregroundStyle(.secondary)

            }
            .padding(.top, 10)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .frame(width: 370, height: 100)
                    .clipShape(.capsule)
                    .foregroundColor(.gray)
                    .opacity(0.2)
                HStack(spacing: 100) {
                    VStack(alignment: .leading) {
                        Text("Total Price")
                            .foregroundStyle(.secondary)
                        Text(String(product.price))
                            .foregroundStyle(.primary)
                            .fontWeight(.bold)
                    }
                                        
                    HStack {
                        Image(systemName: "cart.fill.badge.plus")
                            .resizable()
                            .frame(width: 35, height: 30)
                        Button(action: {}, label: {
                            Text("Buy Now")
                                .font(.headline)
                        })
                    }
                    .frame(width: 130, height: 50)
                    .foregroundColor(.white)
                    .background(.indigo)
                    .cornerRadius(10)
                    
                    
                }.padding()
                
            }
            .padding(.horizontal, 10)
        }
        .padding()
        
    }
}

#Preview {
    ProductDetails(product: ProductModel.sample)
}

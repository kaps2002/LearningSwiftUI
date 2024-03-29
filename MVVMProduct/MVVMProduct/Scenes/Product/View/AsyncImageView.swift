//
//  AsyncImageView.swift
//  MVVMProduct
//
//  Created by Roro on 29/03/24.
//

import SwiftUI

struct AsyncImageView: View {
    let productImage: String
    var body: some View {
        if let url = URL(string: productImage) {
            productImage(url)
        }
    }
    func productImage(_ url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    AsyncImageView(productImage: ProductModel.sample.image)
}

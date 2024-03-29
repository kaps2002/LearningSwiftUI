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
            ProductRowView()
                .navigationTitle("Products")
        }
       
        
    }
}

#Preview {
    ProductView()
}

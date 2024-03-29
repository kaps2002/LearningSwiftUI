//
//  ContentView.swift
//  MVVMProduct
//
//  Created by Roro on 28/03/24.
//

import SwiftUI

struct ContentView: View {
    var viewModel = ProductViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ContentView()
}

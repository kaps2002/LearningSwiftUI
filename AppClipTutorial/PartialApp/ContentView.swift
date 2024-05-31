//
//  ContentView.swift
//  PartialApp
//
//  Created by Roro on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: CoffeeModel
    var body: some View {
        VStack {
            Spacer()
            Image("coffee")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 300)
                .clipShape(Circle())
            Spacer()
            Text(model.selectedItem?.name ?? "Coffee not found")
            Text("\(model.selectedItem?.price ?? 0.0, specifier: "$%.2f")")
            Button("Place Order") {}
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .controlSize(.regular)
                .cornerRadius(40, antialiased: true)
                .padding()
        }
        
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .ignoresSafeArea(.container, edges:.top)
        .background(Color("body"))
    }
}


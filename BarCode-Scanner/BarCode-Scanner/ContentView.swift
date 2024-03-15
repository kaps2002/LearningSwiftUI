//
//  ContentView.swift
//  BarCode-Scanner
//
//  Created by Roro on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Rectangle()
                    .fill(.gray)
                    .frame(maxWidth: .infinity, maxHeight: 350)
                Spacer()
                    .frame(height: 50)
                    
                Label("Scan the Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
            }
            .navigationTitle("Barcode Scanner")
            
        }
            
    }
}

#Preview {
    ContentView()
}

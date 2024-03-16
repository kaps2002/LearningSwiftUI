//
//  ContentView.swift
//  BarCode-Scanner
//
//  Created by Roro on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scannedCode = ""
    
    var body: some View {
        NavigationView{
            VStack{
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 350)
                Spacer()
                    .frame(height: 50)
                    
                Label("Scan the Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode.isEmpty ? "Not yet Scanned" : scannedCode)
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                    .padding()
                    .font(.title)
                
            }
            .navigationTitle("Barcode Scanner")
            
        }
            
    }
}

#Preview {
    ContentView()
}

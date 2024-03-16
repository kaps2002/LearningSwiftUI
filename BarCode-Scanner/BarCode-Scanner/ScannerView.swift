//
//  ScannerView.swift
//  BarCode-Scanner
//
//  Created by Roro on 16/03/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    
    func makeUIViewController(context: Context) -> Scanner {
        Scanner(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: Scanner, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerDeleGate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: Cameraerror) {
            print(error.rawValue)
        }
    
    }
    
}

#Preview {
    ScannerView(scannedCode: .constant(""))
}

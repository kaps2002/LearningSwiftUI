//
//  ImagePicker.swift
//  InterfaceUIKit
//
//  Created by Roro on 31/03/24.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController (configuration: config)
        return picker
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
}

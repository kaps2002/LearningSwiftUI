//
//  ContentView.swift
//  InterfaceUIKit
//
//  Created by Roro on 31/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?

    @State private var showingImage = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button("Show Image") {
                showingImage = true
            }
            
            Button("Save Image"){
                guard let inputImage = inputImage else {return}
                let imageSaver = ImageSaver()
                imageSaver.writetoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImage, content: {
            ImagePicker(image: $inputImage)
        })
        .onChange(of: inputImage) { old, new in
            loadImage()
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
        
    }
}

#Preview {
    ContentView()
}

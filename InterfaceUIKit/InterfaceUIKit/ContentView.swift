//
//  ContentView.swift
//  InterfaceUIKit
//
//  Created by Roro on 31/03/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins


struct ContentView: View {
    
    @State private var image: Image?
    @State private var filterIntensity = 0.0
    @State private var showingImage = false
    @State private var inputImage: UIImage?
    @State private var processedImg: UIImage?

    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Rectangle()
                        .fill(.secondary)
                    
                    VStack {
                        image?
                            .resizable()
                            .frame(width: 200, height: 200)
                        
                        Text("Select a Image")
                            .foregroundStyle(.white)
                    }
                }
                .onTapGesture {
                    showingImage = true
                }
                .sheet(isPresented: $showingImage, content: {
                    ImagePicker(image: $inputImage)
                })
                HStack{
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity) { _ in
                            applyFilter()
                        }
                }
                
                HStack {
                    Button("Change Filter"){}
                    Spacer()
                    Button("Save Photo", action: saveImage)
                }
            }
            .padding()
            .onChange(of: inputImage) { _, _ in
                loadImage()
            }
            .navigationTitle("ImageFilter")
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }

        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyFilter()
    }
  
    func applyFilter() {
        currentFilter.intensity = Float(filterIntensity)
        
        guard let outputImg = currentFilter.outputImage else {return}
        
        if let cgimg = context.createCGImage(outputImg, from: outputImg.extent) {
            let uiImg = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImg)
            processedImg = uiImg
        }
    }
    func saveImage() {
        guard let processedImg = processedImg else {return}
        let imageSaver = ImageSaver()
        imageSaver.writetoAlbum(image: processedImg)
    }
}

#Preview {
    ContentView()
}

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
    @State private var showFilterSheet = false
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
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
                        .onChange(of: filterIntensity) { _, _ in
                            applyFilter()
                        }
                }
                
                HStack {
                    Button("Change Filter"){
                        showFilterSheet = true
                    }
                    Spacer()
                    Button("Save Photo", action: saveImage)
                }
            }
            .padding()
            .onChange(of: inputImage) { _, _ in
                loadImage()
            }
            .confirmationDialog("Select a Filter", isPresented: $showFilterSheet, actions: {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Sepiatone") { setFilter(CIFilter.sepiaTone()) }
                Button("Zoom Blur") { setFilter(CIFilter.zoomBlur()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Edges Blur") { setFilter(CIFilter.edges()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Cancel", role: .cancel) { }

            })
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
        if currentFilter.inputKeys.contains(kCIInputIntensityKey) {
                currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if currentFilter.inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)

        }
        if currentFilter.inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10 , forKey: kCIInputScaleKey)

        }
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
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

#Preview {
    ContentView()
}

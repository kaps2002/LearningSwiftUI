//
//  ContentView.swift
//  InterfaceUIKit
//
//  Created by Roro on 31/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImage = false
    @State private var inputImage: UIImage?
    
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
                }
                
                HStack {
                    Button("Change Filter"){}
                    Spacer()
                    Button("Save Photo"){}
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
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

#Preview {
    ContentView()
}

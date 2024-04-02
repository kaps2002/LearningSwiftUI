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
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Select a Image")
                        .foregroundStyle(.white)
                    
                    image?
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                .onTapGesture {
                    //Select the Image
                }
                HStack{
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                
                HStack {
                    Button("Change Filter"){}
                    Button("Save Photo"){}
                }
            }
            .padding()
            .navigationTitle("ImageFilter")
        }
    }
    
}

#Preview {
    ContentView()
}

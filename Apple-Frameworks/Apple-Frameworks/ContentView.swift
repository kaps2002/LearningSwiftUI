//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Roro on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let cols: [GridItem] = [GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView{
                    LazyVGrid(columns: cols){
                        ForEach(MockData.frameworks, id: \.id) { framework in
                            FrameworkTitle(framework: framework)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                        }
                    }
                }
            }
            .navigationBarTitle("Frameworks ✨")
            .sheet(isPresented: $viewModel.isShowingDetail, content: {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework)
            })
        }
    }
}

struct FrameworkTitle: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.medium)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
        }.padding()
    }
}

#Preview {
    ContentView()
}

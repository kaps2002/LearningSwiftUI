//
//  ContentView.swift
//  DataFlow
//
//  Created by Roro on 28/03/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        if modelData.appPage == 0{
            VStack {
                TextField("PlaceHolder", text: $modelData.appText)
                    .background(.white)
                Button(action: {
                    modelData.appPage = 1
                }, label: {
                    Text("Go to SecondView")
                })
            }
            .ignoresSafeArea()
            .padding()
        } else {
            SecondView()
        }
        
    }
}

class ModelData: ObservableObject {
    @Published var appPage: Int = 0
    @Published var appText: String = ""
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}

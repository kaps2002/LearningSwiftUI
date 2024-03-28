//
//  SecondView.swift
//  DataFlow
//
//  Created by Roro on 28/03/24.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        VStack {
            TextField("PlaceHolder", text: $modelData.appText)
                .background(.white)
            Button(action: {
                modelData.appPage = 0
            }, label: {
                Text("Go to original")
            })
            
        }
        .ignoresSafeArea()
        .padding()
    }
}

#Preview {
    SecondView()
        .environmentObject(ModelData())
}

//
//  ContentView.swift
//  Landmarks
//
//  Created by Roro on 16/03/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            MapView()
                .frame(height: 400)
            CircleView()
                .offset(y: -130)
                .padding(.bottom, -130)
            ScrollView{
                VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                        .fontWeight(.semibold)
                    HStack {
                        Text("Joshua National Park")
                        Spacer()
                        Text("California")
                    }
                    .font(.title3)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    Text("Description")
                        .font(.title2)
                    Text("In sem justo, commodo ut, suscipit at, pharetra vitae, orci. Duis sapien nunc, commodo et, interdum suscipit, sollicitudin et, dolor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam id dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.")
                }
            }.padding()
        }
        Spacer()

    }
}

#Preview {
    ContentView()
}

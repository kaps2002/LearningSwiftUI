//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Roro on 14/03/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    var body: some View {
        VStack {
            FrameworkTitle(framework: framework)
            Text(framework.description)
                .fontWeight(.medium)
                
            Button{
                
            } label:{
                Text("Learn More")
                    .frame(width: 300, height: 50)
                    .foregroundStyle(.black)
                    .background(.teal)
                    .cornerRadius(10)
                
            }.padding(.top, 30)
        }.padding()
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
        .preferredColorScheme(.dark)
}

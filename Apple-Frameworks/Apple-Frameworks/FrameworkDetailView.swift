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
        ZStack {
            Color.customgray
                .ignoresSafeArea()
                .foregroundColor(.white)
            
            VStack {
                HStack{
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .frame(width: 40, height: 40)
                    })
                    .onTapGesture {
                        
                    }
                }
                
                FrameworkTitle(framework: framework)
                    .padding()
                Text(framework.description)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Button{
                } label:{
                    LearnBtn(btnTitle: "Learn More")
                }.padding(.top, 40)
            }.padding(20)
        }
        
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}

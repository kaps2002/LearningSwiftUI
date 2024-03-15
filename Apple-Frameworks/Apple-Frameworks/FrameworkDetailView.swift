//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Roro on 14/03/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetail: Bool
    @State private var isshowingSafari = false
        
    var body: some View {
        ZStack {
            Color.customgray
                .ignoresSafeArea()
                .foregroundColor(.white)
            
            VStack {
                HStack{
                    Spacer()
                    
                    Button{
                        isShowingDetail = false
                    }label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .frame(width: 40, height: 40)
                    }
                }
                
                FrameworkTitle(framework: framework)
                    .padding()
                Text(framework.description)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Button {
                    isshowingSafari = true
                } label: {
                    LearnBtn(btnTitle: "Learn More")
                }
                .padding(.top, 40)
                .fullScreenCover(isPresented: $isshowingSafari, content: {
                    SafariView(url: (URL(string: framework.urlString) ?? URL(string: "www.apple.com"))!)
                })
                
            }.padding(20)
        }
        
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetail: .constant(false))
}

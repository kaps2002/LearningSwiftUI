//
//  SplashScreen.swift
//  FootballStats
//
//  Created by Roro on 06/04/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = true
    @State private var size = 0.7
    @State private var opacity = 0.8
    @State private var isShow = false
    
    var body: some View {
        if isActive {
            VStack {
                VStack(spacing: 10) {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Football Stats")
                        .font(.system(size: 30))
                        .foregroundStyle(Color("DarkBlue"))
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 1.2
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                withAnimation(.snappy(duration: 2.0).delay(2.5)) {
                    self.isActive = false
                }
            }
        }
        else {
            LeagueSelectionView()
        }
    }
}

#Preview {
    SplashScreenView()
}

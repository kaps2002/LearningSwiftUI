//
//  SpecialEffects.swift
//  DrawingSwiftUI
//
//  Created by Roro on 26/03/24.
//

import SwiftUI

struct SpecialEffects: View {
    
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .offset(x: -50, y: -80)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))                .offset(x: 50, y: -80)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)

                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))                    .frame(width: 200 * amount)
                    .blendMode(.screen)

            }
            .padding()
            
            Slider(value: $amount).padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

#Preview {
    SpecialEffects()
}

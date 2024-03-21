//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Roro on 21/03/24.
//

import SwiftUI

struct HikeBadge: View {
    
    var name: String
    
    var body: some View {
        VStack {
            Badge()
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
        }
    }
}

#Preview {
    HikeBadge(name: "Testing")
}

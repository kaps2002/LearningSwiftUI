//
//  StarView.swift
//  FirebaseLearning
//
//  Created by Roro on 10/05/24.
//

import SwiftUI

struct StarView: View {
    
    let rating: Double
    
    var body: some View {
        HStack(spacing: 3) {
            ForEach(0..<5) { index in
                if index < Int(self.rating) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else if index == Int(self.rating) && self.rating - Double(index) >= 0.001 {
                    Image(systemName: "star.lefthalf.fill")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.gray)
                }
            }
        }
    }

}

#Preview {
    StarView(rating: 3.2)
}

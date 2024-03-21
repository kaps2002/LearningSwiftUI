//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Roro on 21/03/24.
//

import SwiftUI

struct CategoryItem: View {
    
    var landmark: Landmark
    
    var body: some View {
        VStack {
            landmark.image
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}

//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Roro on 21/03/24.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(items) { landmark in
                        NavigationLink{
                            LandmarkDetails(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
            .padding()
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(3)))
}

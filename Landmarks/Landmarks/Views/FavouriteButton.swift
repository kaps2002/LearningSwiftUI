//
//  FavouriteButton.swift
//  Landmarks
//
//  Created by Roro on 18/03/24.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {isSet.toggle()}, label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        })
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}

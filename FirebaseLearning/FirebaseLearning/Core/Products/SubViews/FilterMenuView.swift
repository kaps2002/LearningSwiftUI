//
//  ToolBarItemView.swift
//  FirebaseLearning
//
//  Created by Roro on 13/05/24.
//

import SwiftUI

struct FilterMenuView: View {

    @ObservedObject var productViewModel: ProductViewModel
        
        var body: some View {
            Menu(TextStrings.filter.localized() + ": \(productViewModel.selectedFilter?.localizedString ?? "None")") {
                ForEach(ProductViewModel.FilterOption.allCases, id: \.self) { filterOption in
                    Button(filterOption.localizedString) {
                        Task {
                            try await productViewModel.getFilterSelected(option: filterOption)
                        }
                    }
                }
            }
        }
}

#Preview {
    FilterMenuView(productViewModel: ProductViewModel())
}

//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Roro on 15/03/24.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetail = true
        }
    }
    @Published var isShowingDetail = false
}

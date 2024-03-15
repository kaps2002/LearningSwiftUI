//
//  LearnBtn.swift
//  Apple-Frameworks
//
//  Created by Roro on 15/03/24.
//

import SwiftUI

struct LearnBtn: View {
    var btnTitle: String
    var body: some View {
        Text(btnTitle)
            .frame(width: 300, height: 50)
            .foregroundStyle(.black)
            .background(.teal)
            .cornerRadius(10)
    }
}

#Preview {
    LearnBtn(btnTitle:"Sample")
}

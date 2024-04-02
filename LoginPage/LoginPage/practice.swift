//
//  practice.swift
//  LoginPage
//
//  Created by Roro on 02/04/24.
//

import SwiftUI

struct practice: View {
    @State var hello = ""
    var body: some View {
        TextField("hello", text: $hello)
            .frame(height: 100)
            .background(.gray)
            .padding(.horizontal, 20)

    }
}

#Preview {
    practice()
}

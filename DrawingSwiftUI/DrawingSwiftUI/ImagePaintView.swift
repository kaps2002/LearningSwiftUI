//
//  SwiftUIView.swift
//  DrawingSwiftUI
//
//  Created by Roro on 26/03/24.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        Text("Hello, World!")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("tree"), scale: 0.05), width: 30)
    }
}

#Preview {
    ImagePaintView()
}

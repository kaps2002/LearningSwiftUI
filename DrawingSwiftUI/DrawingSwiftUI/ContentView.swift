//
//  ContentView.swift
//  DrawingSwiftUI
//
//  Created by Roro on 24/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y:100))
            path.addLine(to: CGPoint(x: 100, y:300))
            path.addLine(to: CGPoint(x: 300, y:300))
            path.addLine(to: CGPoint(x: 200, y:100))
            path.closeSubpath()
        }
        .stroke(.blue)
        
        Path { path in
            path.move(to: CGPoint(x: 200, y:100))
            path.addLine(to: CGPoint(x: 100, y:300))
            path.addLine(to: CGPoint(x: 300, y:300))
            path.addLine(to: CGPoint(x: 200, y:100))
        }
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        
        
    }
}

#Preview {
    ContentView()
}

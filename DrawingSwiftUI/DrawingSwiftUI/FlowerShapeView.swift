//
//  FlowerView.swift
//  DrawingSwiftUI
//
//  Created by Roro on 26/03/24.
//

import SwiftUI

struct Flower: Shape {
    var petalOffset = -50.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2 , y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width/2))
            
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct FlowerShapeView: View {
    var body: some View {
        Flower()
            .fill(.pink)
            .stroke(.yellow, lineWidth: 3)
    }
}

#Preview {
    FlowerShapeView()
}

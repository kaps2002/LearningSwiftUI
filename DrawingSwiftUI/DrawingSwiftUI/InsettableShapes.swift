//
//  InsettableShapes.swift
//  DrawingSwiftUI
//
//  Created by Roro on 26/03/24.
//

import SwiftUI

struct Arc2: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount: Double = 0.0
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}


struct InsettableShapes: View {
    var body: some View {
        Arc2(startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
            .strokeBorder(.red, lineWidth: 30)
    }
}

#Preview {
    InsettableShapes()
}

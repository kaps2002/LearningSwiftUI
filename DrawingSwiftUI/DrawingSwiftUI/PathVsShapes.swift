//
//  PathVsShapes.swift
//  DrawingSwiftUI
//
//  Created by Roro on 24/03/24.
//

import SwiftUI

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
    
}

struct Arc: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 , startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        return path
    }
}

struct PathVsShapes: View {
    var body: some View {
//        Triangle()
//            .stroke(.green, style: StrokeStyle(lineWidth: 10))
//            .frame(width: 100, height: 100)
        Arc(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: false)
            .frame(width: 200, height: 200)
           
    }
}

#Preview {
    PathVsShapes()
}

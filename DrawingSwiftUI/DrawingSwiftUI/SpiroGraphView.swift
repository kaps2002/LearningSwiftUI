//
//  SpiroGraphView.swift
//  DrawingSwiftUI
//
//  Created by Roro on 26/03/24.
//

import SwiftUI

struct SpiroGraph : Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: Double

    
    func gcd(_ a :Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
    
    func path(in Rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        
        let outerRadius = Double(self.outerRadius)
        let innerRadius = Double(self.innerRadius)
        
        let difference = innerRadius - outerRadius
        let div = Double(divisor)
        let endPoint = ceil(2 * Double.pi * outerRadius / div ) * amount

        var path = Path()
        
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + Double(distance) * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - Double(distance) * sin(difference / outerRadius * theta)
            
            x += Rect.width / 2
            y += Rect.height / 2
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        return path
        
    }
}

struct SpiroGraphView: View {
    
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount = 1.0
    @State private var hue = 0.6
    
    var body: some View {
        SpiroGraph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
            .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 3)
        
        Spacer()
        
        Group {
            Text("Inner Radius: \(Int(innerRadius))")
            Slider(value: $innerRadius, in: 10...150)
                .padding([.horizontal, .bottom])
            
            Text("Outer Radius: \(Int(outerRadius))")
            Slider(value: $outerRadius, in: 10...150)
                .padding([.horizontal, .bottom])

            Text("Distance: \(Int(distance))")
            Slider(value: $distance, in: 1...150)
                .padding([.horizontal, .bottom])

            Text("Amount: \(amount, format: .number.precision(.fractionLength(2)))")
            Slider(value: $amount)
                .padding([.horizontal, .bottom])

            Text("Amount: \(hue)")
            Slider(value: $hue)
                .padding(.horizontal)

        }
    }
}

#Preview {
    SpiroGraphView()
}
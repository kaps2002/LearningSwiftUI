//
//  Swift.swift
//  Landmarks
//
//  Created by Roro on 20/03/24.
//

import Foundation

struct Hike: Hashable, Codable, Identifiable {
    var name: String
    var id: Int
    var distance: Double
    var difficulty: Double
    var observations: [Observation]
    
    static var formatter = LengthFormatter()

    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
        var distanceFromStart: Double
    }
}

//
//  ModelData.swift
//  Landmarks
//
//  Created by Roro on 16/03/24.
//

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var features: [Landmark] {
        landmarks.filter{ $0.isFeatured }
    }
    var profile = Profile.default
}


func load<T: Decodable> (_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    
    else {
        fatalError("Could not read the file \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("could not load the data of of file \(filename)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parsee the \(filename)")
    }
    
}

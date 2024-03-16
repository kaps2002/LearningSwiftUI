//
//  ModelData.swift
//  Landmarks
//
//  Created by Roro on 16/03/24.
//

import Foundation
import SwiftUI

var landmarks: [Landmark] = load("landmarkData.json")

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

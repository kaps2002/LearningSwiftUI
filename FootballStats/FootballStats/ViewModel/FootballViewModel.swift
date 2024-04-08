//
//  FootballViewModel.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import Foundation

@Observable
class FootballViewModel {
    
    var footballmodel: FootballModel?
    var descArray = [Description]()
    
    init(){
        fetchProducts()
        load()
    }
    
    func fetchProducts() {
        APIManager.shared.request(from: "https://api-football-standings.azharimm.dev/leagues/eng.1/standings?season=2020") { [self] result in
            switch result {
            case .success(let leagueResponse):
                self.footballmodel = leagueResponse
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func load()  {
        guard let file = Bundle.main.url(forResource: "Description", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: file)
        let descArray = try? JSONDecoder().decode([Description].self, from: data!)
        self.descArray = descArray!
    }
}

//func load<T: Decodable> (_ filename: String) -> T {
//
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//
//    else {
//        fatalError("Could not read the file \(filename)")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("could not load the data of of file \(filename)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Could not parse the \(filename)")
//    }
//
//}

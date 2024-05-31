//
//  CoffeeModel.swift
//  AppClipTutorial
//
//  Created by Roro on 30/05/24.
//

import Foundation
final class CoffeeModel: ObservableObject {
    @Published public var list: [Coffee] = [Coffee]()
    @Published public var selectedItem: Coffee?
    
    public func fetchCoffee() {
        list = Coffee.list()
    }
    
    public func findCoffeeById(id: String) {
        let coffee = Coffee.list().filter { $0.id == id }
        selectedItem = coffee[0]
    }
}

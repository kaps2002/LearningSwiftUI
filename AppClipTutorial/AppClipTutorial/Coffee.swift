import Foundation

struct Coffee: Identifiable {
    var id: String
    var name: String
    var price: Double
    var image: String
}

extension Coffee {
    static func list() -> [Coffee] {
        return [Coffee(id: "1", name: "Americano", price: 5.00, image: "coffee"), Coffee(id: "2", name: "Latte", price: 7.50, image: "coffee"),
                Coffee(id: "3", name: "Frappuccino", price: 8.00, image: "coffee"), Coffee(id: "4", name: "Iced Coffee", price: 7.99, image: "coffee")
        ]
    }
}

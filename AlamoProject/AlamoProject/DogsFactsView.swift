//
//  DogsFactsView.swift
//  AlamoProject
//
//  Created by Roro on 03/04/24.
//

import SwiftUI
import Alamofire

struct DogFactsModel: Codable {
    var facts: [String]
    var success: Bool
}

struct DogsFactsView: View {
    @State private var facts: [String] = []
    @State private var success: Bool = true
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text(facts.first ?? "Click Button to facts about Dogs 👇")
                    .font(.headline)
                Button("New Fact") {
                    loadData()
                }
                .foregroundColor(.black)
                .frame(width: 200, height: 50)
                .background(.green)
                .cornerRadius(10)
                .padding()
            }
            .navigationTitle("Dog Facts 🐶")
        }
        .padding()
    }
    
    func loadData () {
        AF.request("https://dog-api.kinduff.com/api/facts")
            .validate()
            .responseDecodable(of: DogFactsModel.self) { response in
                switch response.result {
                case .success(let dogfacts):
                    self.facts = dogfacts.facts
                    self.success = dogfacts.success
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}

#Preview {
    DogsFactsView()
}

//
//  ContentView.swift
//  AppClipTutorial
//  Users/roro/Documents/LearningSwiftUI/AppClipTutorial/AppClipTutorial/ContentView.swift
//  Created by Roro on 29/05/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject private var model: CoffeeModel = CoffeeModel()

    var body: some View {
        VStack {
            Spacer()
            Text("Costra Coffeee")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
            List (self.model.list, id: \.id) { item in
                HStack {
                    Image("coffee")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                    VStack (alignment: .leading){
                        Text(item.name)
                        Text("\(item.price, specifier: "$%.2f")")
                    }
                }
                .frame(height: 80)
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 8)
                        .background(Color.clear)
                        .foregroundColor(Color("list_item_bg").opacity(0.7))
                        .padding(
                            EdgeInsets(
                                top: 5,
                                leading: 5,
                                bottom: 5,
                                trailing: 5
                            )
                        )
                )
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .background(Color("body"))
            .onAppear(perform: {
                model.fetchCoffee()
            })
        }
        .background(Color("body"))
    }

}

#Preview {
    ContentView()
}

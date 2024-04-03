//
//  ContentView.swift
//  AlamoProject
//
//  Created by Roro on 03/04/24.
//

import SwiftUI
import Alamofire

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct ContentView: View {
    @State private var posts: [Post] = []
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            List(posts, id: \.id) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Posts")
            .listStyle(.plain)
        }
        .onAppear() {
            self.loadPosts()
        }
    }
    
    func loadPosts() {
        isLoading = true
        AF.request("https://jsonplaceholder.typicode.com/posts")
            .validate()
            .responseDecodable(of: [Post].self) { response in
                isLoading = false
                switch response.result {
                case .success(let posts):
                    self.posts = posts
                    print(posts)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}

#Preview {
    ContentView()
}

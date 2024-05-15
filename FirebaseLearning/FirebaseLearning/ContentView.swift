//
//  ContentView.swift
//  FirebaseLearning
//
//  Created by Roro on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        TabView {
            NavigationStack {
                ProductView()
            }
            .tabItem {
                Label(TextStrings.products.localized(), systemImage: "menucard")
            }
            
            NavigationStack {
                RootView()
            }
            .tabItem {
                Label(TextStrings.profile.localized(), systemImage: "person")
            }
        }
        .onAppear {
            let language = UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String ?? "en"
            languageManager.switchLanguage(to: language)
        }
    }
}

//extension LanguageManager {
//    func localizedString(for key: String) -> String {
//        return NSLocalizedString(key, comment: "")
//    }
//}

#Preview {
    ContentView()
}


//
//  LanguageManager.swift
//  FirebaseLearning
//
//  Created by Roro on 15/05/24.
//

import SwiftUI

class LanguageManager: ObservableObject {
    @Published var currentLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"

    func switchLanguage(to language: String) {
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        currentLanguage = language
        Bundle.setLanguage(language)
    }
}
extension Bundle {
    private static var bundle: Bundle?

    static func setLanguage(_ language: String) {
        object_setClass(Bundle.main, PrivateBundle.self)
        bundle = Bundle(path: Bundle.main.path(forResource: language, ofType: "lproj")!)
    }

    private class PrivateBundle: Bundle {
        override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
            return Bundle.PrivateBundle.bundle?.localizedString(forKey: key, value: value, table: tableName) ?? super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}

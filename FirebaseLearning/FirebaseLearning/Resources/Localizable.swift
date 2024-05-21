//
//  Localizable.swift
//  FirebaseLearning
//
//  Created by Roro on 15/05/24.
//

import Foundation

enum TextStrings: String, CaseIterable {
    
    case products = "text.products"
    case profile = "text.profile"
    case filter = "text.filter"
    case category = "text.category"
    case HightoLow = "text.hightolow"
    case LowtoHigh = "text.lowtohigh"
    case none = "text.none"
    case logout = "text.logout"
    case resetPassword = "text.resetPassword"
    case deleteAccount = "text.deleteAccount"
    case settings = "text.settings"
    case rating = "text.rating"
    case userId = "text.userId"
    case userPremium = "text.userPremium"
    case chooseLang = "text.chooseLang"

    func localized() -> String {
        return NSLocalizedString(self.rawValue, tableName: "Localizable", bundle: .main, comment: rawValue)
    }
    
}

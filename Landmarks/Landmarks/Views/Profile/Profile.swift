//
//  Profile.swift
//  Landmarks
//
//  Created by Roro on 21/03/24.
//

import Foundation

struct Profile {
    var name: String
    var preferNotifications = true
    
    var seasonalPhoto = Season.spring
    var goalDate = Date()
    
    static let `default` = Profile(name: "kaps2002")
    
    enum Season: String, CaseIterable, Identifiable {
        case Summer = "☀️"
        case Winter = "☃️"
        case autumn = "🍁"
        case spring = "🌷"
        var id: String {rawValue}
    }
   
}

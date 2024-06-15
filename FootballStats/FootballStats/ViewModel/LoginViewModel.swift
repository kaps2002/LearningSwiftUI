//
//  LoginViewModel.swift
//  FootballStats
//
//  Created by Roro on 15/06/24.
//

import Foundation

@Observable
class LoginViewModel {
    var email: String = ""
    var password: String = ""
    var isEmailValid: Bool = true
    var isPasswordValid: Bool = true
    var isSecured: Bool = true
    var name: String = ""
    var isNameValid: Bool = true
}

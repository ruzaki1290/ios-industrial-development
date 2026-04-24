//
//  Checker.swift
//  Navigation
//

import Foundation

final class Checker {
    
    static let shared = Checker()
    
    private init() {}
    
    private let login = "Rus"
    private let password = "12345"
    
    func check(login: String, password: String) -> Bool {
        return self.login == login && self.password == password
    }
    
}


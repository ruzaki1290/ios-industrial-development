//
//  Checker.swift
//  Navigation
//

import Foundation

final class Checker {
    
    static let shared = Checker()
    
    private let users: [String: String] = [
        "HipsterCat": "12345",
        "TestUser": "abcde"
    ]
    
    private init() {}
    
    func check(login: String, password: String) -> Bool {
        return users[login] == password
    }
    
}


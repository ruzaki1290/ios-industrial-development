//
//  Untitled.swift
//  Navigation
//

import Foundation

final class ProfileViewModel {
    
    // MARK: - Properties
    private let userService: UserService
    private let user: User
    
    // MARK: - Init
    init(userService: UserService, user: User) {
        self.userService = userService
        self.user = user
    }
    
} // ProfileViewModel


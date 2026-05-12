//
//  Untitled.swift
//  Navigation
//

import UIKit

final class ProfileViewModel {
    
    // MARK: - Properties
    private let userService: UserService
    private let user: User
    
    // MARK: - Init
    init(userService: UserService, user: User) {
        self.userService = userService
        self.user = user
    }
    
    // MARK: - Public Properties
    var fullName: String {
        user.fullName
    }
    
    var avatar: UIImage {
        user.avatar
    }
    
    var status: String {
        user.status
    }
    
    var profileUser: User {
        user
    }
    
} // ProfileViewModel


//
//  Untitled.swift
//  Navigation
//

import UIKit


enum ProfileViewModelState {
    case initial
    case loading
    case loaded(User)
    case error(String)
}

final class ProfileViewModel {
    
    // MARK: - Properties
    private let userService: UserService
    private let user: User
    
    private(set) var state: ProfileViewModelState = .initial
    
    var onStateChanged: ((ProfileViewModelState) -> Void)?
    
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
    
     // MARK: - Methods
    private func updateState(_ newState: ProfileViewModelState) {
        state = newState
        onStateChanged?(newState)
    }
    
    func loadUser() {
        updateState(.loading)
        
        updateState(.loaded(user))
    }
    
} // ProfileViewModel


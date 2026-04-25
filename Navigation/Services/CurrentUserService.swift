//
//  CurrentUserService.swift
//  Navigation
//

import UIKit

final class CurrentUserService: UserService {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func checkUser(login: String) -> User? {
        return user.login == login ? user : nil
    }
    
}

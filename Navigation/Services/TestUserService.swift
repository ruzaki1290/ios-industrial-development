//
//  TestUserServicd.swift
//  Navigation
//

import UIKit

final class TestUserService: UserService {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func checkUser(login: String) -> User? {
        return login == user.login ? user : nil
    }
    
}

//
//  LoginInspector.swift
//  Navigation
//

import Foundation

struct LoginInspector: LoginViewControllerDelegate {
    
    private let checkerService: CheckerServiceProtocol
    
    init(checkerService: CheckerServiceProtocol) {
        self.checkerService = checkerService
    }
    
    func check(
        login: String,
        password: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        checkerService.checkCredentials(
            email: login,
            password: password,
            completion: completion
        )
        
    }
    
}


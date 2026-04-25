//
//  UserService.swift
//  Navigation
//
import Foundation

protocol UserService {
    var user: User { get set }
    func checkUser(login: String) -> User?
}

extension UserService {
    func checkUser(login: String) -> User? {
        return login == user.login ? user : nil
    }
}

//
//  MyLoginFactory.swift
//  Navigation
//
import Foundation

struct MyLoginFactory: LoginFactory {
    
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector(checkerService: CheckerService())
    }
    
}


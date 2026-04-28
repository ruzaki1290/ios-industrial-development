//
//  LoginFactory.swift
//  Navigation
//
import Foundation

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}


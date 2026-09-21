//
//  Settings.swift
//  Navigation
//

import Foundation

final class Settings {
    
    static let shared = Settings()
    
    var isSortingEnabled: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isSortingEnabled")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isSortingEnabled")
        }
    }
    
} // Settings

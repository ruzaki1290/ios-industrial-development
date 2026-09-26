//
//  Settings.swift
//  Navigation
//

import Foundation

public final class Settings {
    
    public static let shared = Settings()
    
    public var isSortingEnabled: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isSortingEnabled")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isSortingEnabled")
        }
    }
    
} // Settings

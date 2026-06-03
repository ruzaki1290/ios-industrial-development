//
//  NetworkService.swift
//  Navigation
//

import Foundation

struct NetworkService {
    
    static func request(for configuration: AppConfiguration) {
        
        var url: URL
        switch configuration {
        case .people(let value):
            url = value
        case .starship(let value):
            url = value
        case .planet(let value):
            url = value
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) {
            data, response, error in
        }
        
        task.resume()
        
    }
    
} // NetworkService

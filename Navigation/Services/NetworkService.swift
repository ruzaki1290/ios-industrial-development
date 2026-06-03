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
        
        let task = session.dataTask(with: url) { data, response, error in
            
            // При использовании swapi.dev был получен:
            // Error Code: -1200
            // "A TLS error caused the secure connection to fail."
            //
            // При отключении интернета был получен:
            // Error Code: -1001
            // "The request timed out."
            
            if let error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                print("Status Code: \(httpResponse.statusCode)")
                
                print("Headers:")
                print(httpResponse.allHeaderFields)
                
            }
            
            if let data,
               let stringData = String(data: data, encoding: .utf8) {
                print("Data:")
                print(stringData)
            }
            
        }
        
        task.resume()
        
    } // request
    
} // NetworkService

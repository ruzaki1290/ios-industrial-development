//
//  Coordinator.swift
//  Navigation
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    
    func start()
    
}

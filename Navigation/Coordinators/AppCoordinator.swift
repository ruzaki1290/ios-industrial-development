//
//  AppCoordinator.swift
//  Navigation
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    private let window: UIWindow
    private let tabBarController = UITabBarController()
    private var profileCoordinator: ProfileCoordinator?
    private var feedCoordinator: FeedCoordinator?
    
    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        
        let passwordVC = PasswordViewController()
           let navigationController = UINavigationController(rootViewController: passwordVC)
        
           window.rootViewController = navigationController
           window.makeKeyAndVisible()
           return
        
        profileCoordinator = ProfileCoordinator(
            navigationController: UINavigationController()
        )
        
        profileCoordinator?.start()
        
        
        feedCoordinator = FeedCoordinator(
            navigationController: UINavigationController()
        )
        
        feedCoordinator?.start()
        
        tabBarController.viewControllers = [
            profileCoordinator!.navigationController,
            feedCoordinator!.navigationController
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
    } // start()
    
    
} // AppCoordinator


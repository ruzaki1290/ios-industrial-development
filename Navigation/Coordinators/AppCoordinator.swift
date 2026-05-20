//
//  AppCoordinator.swift
//  Navigation
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    private let window: UIWindow
    private let tabBarController = UITabBarController()
    
    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        
        // create tab bar with feed and profile items
        let loginVC = LoginViewController()
        let profileNC = UINavigationController(rootViewController: loginVC)
        profileNC.tabBarItem = UITabBarItem(title: "Profile",
                                            image: UIImage(systemName: "person.crop.circle"),
                                            selectedImage: UIImage(systemName: "person.crop.circle.fill")
        )
        
        let feedVC = FeedCoordinator(
            navigationController: UINavigationController()
        )
        
        feedVC.start()

        tabBarController.tabBar.backgroundColor = .white
        tabBarController.viewControllers = [
            profileNC, feedVC.navigationController
        ]
        
        // activate main window
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
    }
    
    
} // AppCoordinator


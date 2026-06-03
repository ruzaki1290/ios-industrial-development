//
//  FeedCoordinator.swift
//  Navigation
//

import UIKit

final class FeedCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let feedVC = FeedViewController()
        feedVC.coordinator = self
        navigationController.setViewControllers([feedVC], animated: false)
        
        navigationController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: UIImage(systemName: "text.bubble"),
            selectedImage: UIImage(systemName: "text.bubble.fill")
        )
        
    }
    
    func showPost() {
        let postVC = PostViewController()
        navigationController.pushViewController(postVC, animated: true)
    }
    
} // FeedCoordinator

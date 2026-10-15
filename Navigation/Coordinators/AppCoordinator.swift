//
//  AppCoordinator.swift
//  Navigation
//

import UIKit
import StorageService

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
        
        passwordVC.onPasswordSuccess = { [weak self] in
            self?.showMainApp()
        }
        
        let navigationController = UINavigationController(rootViewController: passwordVC)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    } // start()
    
    private func showMainApp() {
        
        profileCoordinator = ProfileCoordinator(
            navigationController: UINavigationController()
        )

        profileCoordinator?.start()

        feedCoordinator = FeedCoordinator(
            navigationController: UINavigationController()
        )

        feedCoordinator?.start()
        
        let documentsVC = DocumentsViewController()
        documentsVC.tabBarItem = UITabBarItem(
            title: "Documents",
            image: UIImage(systemName: "folder"),
            tag: 2
        )

        let documentsNavigationController = UINavigationController(
            rootViewController: documentsVC
        )
        
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            tag: 3
        )

        let settingsNavigationController = UINavigationController(
            rootViewController: settingsVC
        )

        tabBarController.viewControllers = [
            profileCoordinator!.navigationController,
            feedCoordinator!.navigationController,
            documentsNavigationController,
            settingsNavigationController
        ]

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
    } // showMainApp()
    
    
} // AppCoordinator


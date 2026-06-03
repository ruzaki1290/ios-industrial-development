//
//  ProfileCoordinator.swift
//  Navigation
//

import UIKit

final class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        
        navigationController.setViewControllers([loginVC], animated: false)
        
        navigationController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.crop.circle"),
            selectedImage: UIImage(systemName: "person.crop.circle.fill")
        )
        
    }
    
    func showProfile(user: User) {
        /*
        let user = User(
            login: "User",
            fullName: "User Name",
            avatar: UIImage(named: "hipster_cat") ?? UIImage(),
            status: "Hello"
        )
        */
        
        let userService = CurrentUserService(user: user)
        let viewModel = ProfileViewModel(userService: userService, user: user)
        let profileVC = ProfileViewController(viewModel: viewModel)
        
        navigationController.pushViewController(profileVC, animated: true)
        
    }
    
    
} // ProfileCoordinator

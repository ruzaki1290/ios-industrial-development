//
//  AppDelegate.swift
//  Navigation
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let appConfiguration: AppConfiguration = [
            .people(URL(string: "https://swapi.info/api/people/8")!),
            .starship(URL(string: "https://swapi.info/api/starships/3")!),
            .planet(URL(string: "https://swapi.info/api/planets/5")!)
        ].randomElement()!

        NetworkService.request(for: appConfiguration)
        
        if let window = window {
            appCoordinator = AppCoordinator(window: window)
            appCoordinator?.start()
        }
        
        return true
        
    } // application
    
} // AppDelegate


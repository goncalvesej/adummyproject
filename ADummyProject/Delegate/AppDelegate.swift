//
//  AppDelegate.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator : AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         
        window = UIWindow(frame: UIScreen.main.bounds)
         let navigationController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: navigationController,
                                        service: Service.shared)
         appCoordinator!.start()
         window!.rootViewController = navigationController
         window!.makeKeyAndVisible()
        
        return true
    }

}


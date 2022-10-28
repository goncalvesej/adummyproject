//
//  AppDelegate.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import UIKit

@main
internal class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?
    internal var appCoordinator: AppCoordinator?

    internal func application(_ application: UIApplication,
                              didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

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

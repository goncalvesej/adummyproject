//
//  AppCoordinator.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 27/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import UIKit
import Coordinator

internal enum AppCoordinatorEvent: CoordinatorEvent {

    case home, faq, pop
    case commentsByPost(Int)

}

internal class AppCoordinator: CoordinatorProtocol {

    internal let uuid = String(describing: AppCoordinator.self)

    internal var parentCoordinator: CoordinatorProtocol?
    internal var children: [CoordinatorProtocol] = []
    internal var navigationController: UINavigationController

    private var service: ServiceProtocol

    internal init(navigationController: UINavigationController,
                  service: ServiceProtocol) {

        self.navigationController = navigationController
        self.service = service

    }

    internal func start() {
        self.handle(AppCoordinatorEvent.home)
    }

    internal func handle(_ event: CoordinatorEvent) {
        if let appEvent = event as? AppCoordinatorEvent {
            switch appEvent {
            case .home:
                navigateToHome()
            case .faq:
                let coordinator = FaqCoordinator(navigationController: navigationController)
                coordinator.start()
            case let .commentsByPost(postId):
                navigateToCommentsByPost(postId)
            case .pop:
                popNavigation()
            }
            return
        }
        guard let parentCoordinator else {
            fatalError()
        }
        parentCoordinator.handle(event)
    }

}

// MARK: Extension - Navigation methods

extension AppCoordinator {

    private func navigateToHome() {
        let viewController = HomeViewController(service, self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func navigateToCommentsByPost(_ postId: Int) {
//        let viewController = HomeViewController(service, self)
//        navigationController.pushViewController(viewController, animated: true)
    }

    private func popNavigation() {
        if navigationController.viewControllers.count > 1 {
            var viewControllers = navigationController.viewControllers
            viewControllers.removeLast()
            navigationController.setViewControllers(viewControllers, animated: true)
            return
        }
    }

}

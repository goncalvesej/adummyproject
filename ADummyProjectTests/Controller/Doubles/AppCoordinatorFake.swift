//
//  AppCoordinatorFake.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Coordinator
import UIKit

@testable import ADummyProject

internal final class AppCoordinatorFake: CoordinatorProtocol {
    
    internal var isNavigateToPostsCalled = false
    internal var isNavigateToCommentsByPostCalled = false
    internal var isPopCalled = false
    internal var isFaqCalled = false

    internal let uuid = String(describing: AppCoordinatorFake.self)

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
        self.handle(AppCoordinatorEvent.posts)
    }

    internal func handle(_ event: CoordinatorEvent) {
        if let appEvent = event as? AppCoordinatorEvent {
            switch appEvent {
            case .posts:
                navigateToPosts()
            case .faq:
                isPopCalled = true
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

extension AppCoordinatorFake {

    private func navigateToPosts() {
        isNavigateToPostsCalled = true
    }

    private func navigateToCommentsByPost(_ postId: Int) {
        isNavigateToCommentsByPostCalled = true
    }

    private func popNavigation() {
        isPopCalled = true
    }

}


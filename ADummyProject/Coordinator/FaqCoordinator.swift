//
//  FaqCoordinator.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Coordinator
import UIKit

internal enum FaqCoordinatorEvent: CoordinatorEvent {

    case faq, pop

}

internal class FaqCoordinator: CoordinatorProtocol {

    internal let uuid = String(describing: FaqCoordinator.self)

    internal var parentCoordinator: CoordinatorProtocol?
    internal var children: [CoordinatorProtocol] = []
    internal var navigationController: UINavigationController

    internal init(navigationController: UINavigationController, parentCoordinator: CoordinatorProtocol? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }

    internal func start() {
        handle(FaqCoordinatorEvent.faq)
    }

    internal func handle(_ event: CoordinatorEvent) {
        if let faqEvent = event as? FaqCoordinatorEvent {
            switch faqEvent {
            case .faq:
                navigateToFaq()
            case .pop:
                popNavigation()
            }
            return
        }
        guard let parentCoordinator else {
            fatalError("event not found in coordinator chain")
        }
        parentCoordinator.handle(event)

    }

}

// MARK: Extension - Navigation methods

extension FaqCoordinator {

    private func navigateToFaq() {
        let viewController = FaqViewController(self)
        navigationController.pushViewController(viewController, animated: true)
    }

    private func popNavigation() {
        if navigationController.viewControllers.count > 0 {
            var viewControllers = navigationController.viewControllers
            viewControllers.removeLast()
            navigationController.setViewControllers(viewControllers, animated: true)
            parentCoordinator?.removeChild(self)
        }
    }

}

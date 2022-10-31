//
//  FaqCoordinatorFake.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Coordinator
import UIKit

@testable import ADummyProject

internal final class FaqCoordinatorFake: CoordinatorProtocol {
    
    internal var isNavigateToFaqCalled = false
    internal var isPopCalled = false

    internal let uuid = String(describing: FaqCoordinatorFake.self)

    internal var parentCoordinator: CoordinatorProtocol?
    internal var children: [CoordinatorProtocol] = []
    internal var navigationController: UINavigationController


    internal init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    internal func start() -> FaqViewController {
        self.handle(FaqCoordinatorEvent.faq)
        let viewController = FaqViewController(self)
        navigationController.pushViewController(viewController, animated: false)
        return viewController
    }

    internal func handle(_ event: CoordinatorEvent) {
        if let faqEvent = event as? FaqCoordinatorEvent {
            switch faqEvent {
            case .faq:
                isNavigateToFaqCalled = true
            case .pop:
                isPopCalled = true
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

extension FaqCoordinatorFake {

    private func navigateToFaq() {
        isNavigateToFaqCalled = true
    }

    private func popNavigation() {
        isPopCalled = true
    }

}


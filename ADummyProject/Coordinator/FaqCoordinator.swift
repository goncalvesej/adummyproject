//
//  FaqCoordinator.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 28/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import UIKit

internal enum FaqCoordinatorEvent: CoordinatorEvent {

    case faq, pop
    
}

internal class FaqCoordinator: Coordinator {
    
    let uuid = String(describing: FaqCoordinator.self)    
    
    internal var parentCoordinator: Coordinator?
    internal var children: [Coordinator] = []
    internal var navigationController: UINavigationController
    
    private var service: ServiceProtocol
    
    internal init(navigationController : UINavigationController,
                  service: ServiceProtocol) {
        
        self.navigationController = navigationController
        self.service = service
        
    }
    
    internal func start() {
        handle(FaqCoordinatorEvent.faq)
    }
    
    func handle(_ event: CoordinatorEvent) {
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
        let viewController = FaqViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func popNavigation() {
        if navigationController.viewControllers.count > 1 {
            var viewControllers = navigationController.viewControllers
            viewControllers.removeLast()
            navigationController.setViewControllers(viewControllers, animated: true)
            return
        }
        parentCoordinator?.removeChild(self)
    }
    
}

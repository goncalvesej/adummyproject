//
//  Coordinator.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 27/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import UIKit

protocol CoordinatorEvent {
    
}

protocol Coordinator {
    
    var uuid: String { get }
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
    func handle(_ event: CoordinatorEvent)
    mutating func appendChild(_ coordinator: Coordinator)
    mutating func removeChild(_ coordinator: Coordinator)
    
}

extension Coordinator {
    
    internal mutating func appendChild(_ coordinator: Coordinator) {
        children.append(coordinator)
    }
    
    internal mutating func removeChild(_ coordinator: Coordinator) {
        children.removeAll(where: { coo in
            coo.uuid == coordinator.uuid
        })
    }
    
}

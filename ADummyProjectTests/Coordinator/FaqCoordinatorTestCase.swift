//
//  FaqCoordinatorTestCase.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 31/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation
import XCTest

@testable import ADummyProject

internal final class FaqCoordinatorTestCase: XCTestCase {

    private var sut: FaqCoordinator!
    private var parentCoordinator: AppCoordinator!
    private var service: ServiceMock!
    private var navigationController: UINavigationController!

    internal override func setUp() {
        navigationController = UINavigationController()
        service = ServiceMock()
        parentCoordinator = AppCoordinator(navigationController: navigationController, service: service)
        parentCoordinator.start()
    }

    internal override func tearDown() {
        super.tearDown()
        sut = nil
        service = nil
        navigationController = nil
        parentCoordinator = nil
    }

    internal func testFaqEvents() throws {
        XCTAssertEqual(parentCoordinator.children.count, 0)
        XCTAssertEqual(navigationController.viewControllers.count, 1)

        parentCoordinator.handle(AppCoordinatorEvent.faq)
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for 1 second")], timeout: 1.0)
        sut = try XCTUnwrap(parentCoordinator.children.first as? FaqCoordinator)

        XCTAssertEqual(parentCoordinator.children.count, 1)
        XCTAssertEqual(navigationController.viewControllers.count, 2)

        sut.handle(FaqCoordinatorEvent.pop)
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for 1 second")], timeout: 1.0)

        XCTAssertEqual(parentCoordinator.children.count, 0)
        XCTAssertEqual(navigationController.viewControllers.count, 1)

    }
}

//
//  AppCoordinatorTestCase.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 31/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation
import XCTest

@testable import ADummyProject

internal final class AppCoordinatorTestCase: XCTestCase {

    private var sut: AppCoordinator!
    private var service: ServiceMock!
    private var navigationController: UINavigationController!

    internal override func setUp() {
        navigationController = UINavigationController()
        service = ServiceMock()
        sut = AppCoordinator(navigationController: navigationController, service: service)
    }

    internal override func tearDown() {
        super.tearDown()
        sut = nil
        service = nil
        navigationController = nil
    }

    internal func testAppEvents() {
        XCTAssertEqual(sut.children.count, 0)
        XCTAssertEqual(navigationController.viewControllers.count, 0)

        sut.handle(AppCoordinatorEvent.posts)
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for 1 second")], timeout: 1.0)
        XCTAssertEqual(navigationController.viewControllers.count, 1)

        sut.handle(AppCoordinatorEvent.commentsByPost(1))
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for 1 second")], timeout: 1.0)
        XCTAssertEqual(navigationController.viewControllers.count, 2)
    }
}

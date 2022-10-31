//
//  FAQViewControllerTestCase.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation
import Coordinator
import XCTest

@testable import ADummyProject

internal final class FAQViewControllerTestCase: XCTestCase {

    internal var sut: FaqViewController!
    internal var fakeCoordinator: FaqCoordinatorFake!
    internal var navigationController: UINavigationController!

    internal override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        fakeCoordinator = FaqCoordinatorFake(navigationController: navigationController)
        fakeCoordinator.start()
    }

    internal override func tearDown() {
        super.tearDown()
        sut = nil
        fakeCoordinator = nil
        navigationController = nil
    }

    internal func testViewControllerNavigation() throws {
        sut = try XCTUnwrap(navigationController.viewControllers.first as? FaqViewController)
        let view = try XCTUnwrap(sut.view as? FaqView)
        XCTAssertNotNil(view)
        XCTAssertEqual(sut.title, "FAQ")
    }

    internal func testEvent() throws {
        sut = try XCTUnwrap(navigationController.viewControllers.first as? FaqViewController)
        sut.view.layoutIfNeeded()
        XCTAssertTrue(fakeCoordinator.isNavigateToFaqCalled)
        XCTAssertFalse(fakeCoordinator.isPopCalled)
        let navigationItem = try XCTUnwrap(sut.navigationItem)
        let backButton = try XCTUnwrap(navigationItem.leftBarButtonItem)
        _ = backButton.target?.perform(backButton.action)
        XCTAssertTrue(fakeCoordinator.isPopCalled)
    }

}

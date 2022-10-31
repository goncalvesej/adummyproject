//
//  PostViewControllerTestCase.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation
import XCTest

@testable import ADummyProject

internal final class PostViewControllerTestCase: XCTestCase {

    internal var sut: PostViewController!
    internal var fakeCoordinator: AppCoordinatorFake!
    internal var service: ServiceMock!
    internal var navigationController: UINavigationController!

    internal override func setUpWithError() throws {
        super.setUp()
        service = ServiceMock()
        navigationController = UINavigationController()
        fakeCoordinator = AppCoordinatorFake(navigationController: navigationController, service: service)
        fakeCoordinator.start()
    }

    internal override func tearDown() {
        super.tearDown()
        sut = nil
        fakeCoordinator = nil
        service = nil
        navigationController = nil
    }

    internal func testViewControllerNavigation() throws {
        sut = try XCTUnwrap(navigationController.viewControllers.first as? PostViewController)
    }

    internal func testEvent() throws {
        sut = try XCTUnwrap(navigationController.viewControllers.first as? PostViewController)
        let indexPath = IndexPath(row: 0, section: 0)
        let view = try XCTUnwrap(sut.view as? PostView)
        view.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
        view.tableView.delegate?.tableView?(view.tableView, didSelectRowAt: indexPath)
        XCTAssertTrue(fakeCoordinator.isNavigateToCommentsByPostCalled)
        XCTAssertEqual(fakeCoordinator.postIdCommentsCalled, 1)
    }

}

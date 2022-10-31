//
//  PostViewTestCase.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import Foundation

import UIKit
import Components
import XCTest

@testable import ADummyProject

internal final class PostViewTestCase: XCTestCase {

    internal var sut: PostView!
    internal var delegate: PostViewDelegateFake!

    internal override func setUp() {
        super.setUp()
        sut = PostView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        delegate = PostViewDelegateFake()
        sut.viewModel = PostViewModel.dummy
        sut.theDelegate = delegate
    }

    internal override func tearDown() {
        super.tearDown()
        sut = nil
        delegate = nil
    }

    internal func testRender() throws {
        sut.layoutIfNeeded()
        XCTAssertEqual(sut.container.backgroundColor, Theme.shared.colors.background_base)
        XCTAssertEqual(sut.container.backgroundColor, Theme.shared.colors.background_base)
        XCTAssertEqual(sut.tableView.rowHeight, UITableView.automaticDimension)
        XCTAssertEqual(sut.tableView.backgroundColor, Theme.shared.colors.background_base)
        XCTAssertEqual(sut.tableView.separatorStyle, UITableViewCell.SeparatorStyle.singleLine)
        XCTAssertEqual(sut.tableView.separatorColor, Theme.shared.colors.feedback_success_light)
        XCTAssertEqual(sut.tableView.numberOfSections, 1)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }
    
    internal func testCell() throws {
        sut.layoutIfNeeded()
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = try XCTUnwrap(sut.tableView.cellForRow(at: indexPath) as? BasicCellView)
        XCTAssertEqual(cell.backgroundColor, Theme.shared.colors.background_base)
        XCTAssertEqual(cell.nameLabel.textColor, Theme.shared.colors.foreground_base)
        XCTAssertEqual(cell.nameLabel.numberOfLines, 0)
        XCTAssertEqual(cell.nameLabel.text, "some title 1")
    }
    
    internal func testDelegate() {
        sut.layoutIfNeeded()
        sut.theDelegate = delegate
        XCTAssertNil(delegate.selectedIndexPath)
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .top)
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: indexPath)
        XCTAssertEqual(indexPath, delegate.selectedIndexPath)
    }

}

//
//  FaqViewTestCase.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 30/10/22.
//  Copyright © 2022 goncalvesej. All rights reserved.
//

import UIKit
import Components
import XCTest

@testable import ADummyProject

internal final class FaqViewTestCase: XCTestCase {

    internal var sut: FaqView!

    internal override func setUp() {
        super.setUp()
        sut = FaqView()
        sut.viewModel = FaqViewModel.dummy
        
    }

    internal override func tearDown() {
        super.tearDown()
        sut = nil
    }

    internal func testRender() throws {
        XCTAssertEqual(sut.container.backgroundColor, Theme.shared.colors.background_base)
        XCTAssertEqual(sut.label.textColor, Theme.shared.colors.foreground_base)
        XCTAssertEqual(sut.label.text, "FaqViewModel text")
        XCTAssertEqual(sut.label.numberOfLines, 0)
        XCTAssertEqual(sut.label.textAlignment, .justified)
    }

}


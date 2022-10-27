//
//  HomeViewControllerTestCase.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation
import XCTest

@testable import ADummyProject

internal final class HomeViewControllerTestCase: XCTestCase {
    
    var sut: HomeViewController!
    
    
    internal override func setUp() {
        super.setUp()
        sut = HomeViewController(ServiceMock())
    }
    
    internal override func tearDown() {
        sut = nil
    }
    
    internal func testCase1() {
        
    }
    
}

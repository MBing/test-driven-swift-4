//
//  InputViewControllerTests.swift
//  Tests
//
//  Created by Martin Demiddel on 23.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import XCTest
@testable import ToDo

class InputViewControllerTests: XCTestCase {
    var sut: InputViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "InputViewController")
            as! InputViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_HasTitleTextField() {
        let titleTextFieldIsSubView =
            sut.titleTextField?.isDescendant(
                of: sut.view) ?? false
        XCTAssertTrue(titleTextFieldIsSubView)
    }
}

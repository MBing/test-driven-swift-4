//
//  FirstDemoTests.swift
//  FirstDemoTests
//
//  Created by Martin Demiddel on 26.03.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import XCTest
@testable import FirstDemo

class FirstDemoTests: XCTestCase {
    var viewController: ViewController!

    override func setUp() {
        super.setUp()
        viewController = ViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_NumberOfVowels_WhenPassedMartin_ReturnsTwo() {
        let string = "Martin"
        let numberOfVowels = viewController.numberOfVowels(in: string)
        
        XCTAssertEqual(numberOfVowels, 2, "should find 2 vowels in Martin")
    }
    
    func test_MakeHeadline_ReturnsStringWithEachWordStartCapital() {
        let input = "this is A test headline"
        let expectedOutput = "This Is A Test Headline"
        let headline = viewController.makeHeadline(from: input)
        
        XCTAssertEqual(headline, expectedOutput)
    }
    
    func test_MakeHeadline_ReturnsStringWithEachWordStartCapital2() {
        let input = "Here is another example"
        let expectedOutput = "Here Is Another Example"
        let headline = viewController.makeHeadline(from: input)
        
        XCTAssertEqual(headline, expectedOutput)
    }
}

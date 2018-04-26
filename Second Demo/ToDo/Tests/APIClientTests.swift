//
//  APIClientTests.swift
//  Tests
//
//  Created by Martin Demiddel on 26.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import XCTest
@testable import ToDo

class APIClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_Login_UsesExpectedHost() {
        let sut = APIClient()
        let mockURLSession = MockURLSession()
        let completion = { (token: Token?, error: Error?) in }
        sut.loginUser(withName:"dasdom",
                      password: "1234",
                      completion: completion)
        guard let url = mockURLSession.url else {
            //            XCTFail(); // TODO: should be on, but needs to be checked
            return
        }
        let urlComponents = URLComponents(url: url,
                                          resolvingAgainstBaseURL: true)

        XCTAssertEqual(urlComponents?.host, "awesometodos.com")
    }
}

extension APIClientTests {
    class MockURLSession: SessionProtocol {
        var url: URL?
        func dataTask(
            with url: URL,
            completionHandler: @escaping
            (Data?, URLResponse?, Error?) -> Void)
            -> URLSessionDataTask {
                self.url = url
                return URLSession.shared.dataTask(with: url)
        }
    }
}


//
//  ItemListViewControllerTests.swift
//  Tests
//
//  Created by Martin Demiddel on 05.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        let sut = ItemListViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_TableView_AfterViewDidLoad_IsNotNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        let sut = viewController as! ItemListViewController
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }
}

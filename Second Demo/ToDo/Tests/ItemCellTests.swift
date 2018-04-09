//
//  ItemCellTests.swift
//  Tests
//
//  Created by Martin Demiddel on 09.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}

extension ItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath)
            -> UITableViewCell {

                return UITableViewCell()
        }
    }
}

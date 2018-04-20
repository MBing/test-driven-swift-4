//
//  DetailViewControllerTests.swift
//  Tests
//
//  Created by Martin Demiddel on 20.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDo

class DetailViewControllerTests: XCTestCase {
    var sut: DetailViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "DetailViewController")
            as! DetailViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_HasTitleLabel() {
        let titleLabelIsSubView =
            sut.titleLabel?.isDescendant(
                of: sut.view) ?? false

        XCTAssertTrue(titleLabelIsSubView)
    }
    
    func test_HasMapView() {
        let mapViewIsSubView =
            sut.mapView?.isDescendant(
                of: sut.view) ?? false

        XCTAssertTrue(mapViewIsSubView)
    }

    func test_SettingItemInfo_SetsTextToTitleLabel() {
        let item = ToDoItem(title: "Bar",
                            itemDescription: nil,
                            timestamp: 1456150025,
                            location: nil)
        let itemManager = ItemManager()
        itemManager.add(item)
        sut.itemInfo = (itemManager, 0)
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()

        XCTAssertEqual(sut.titleLabel.text, "Bar")
    }

    func test_SettingItemInfo_SetsTextToDescriptionLabel() {
        let item = ToDoItem(title: "Bar",
                            itemDescription: "Baz",
                            timestamp: 1456150025,
                            location: nil)
        let itemManager = ItemManager()
        itemManager.add(item)
        sut.itemInfo = (itemManager, 0)
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertEqual(sut.descriptionLabel.text, "Baz")
    }
    
    func test_SettingItemInfo_SetsTextToDateLabel() {
        let item = ToDoItem(title: "Bar",
                            itemDescription: nil,
                            timestamp: 1456150025,
                            location: nil)
        let itemManager = ItemManager()
        itemManager.add(item)
        sut.itemInfo = (itemManager, 0)
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertEqual(sut.dateLabel.text, "02/22/2016")
    }
    
    func test_SettingItemInfo_SetsTextToLocationLabel() {
        let location = Location(name: "Foo", coordinate: nil)
        let item = ToDoItem(title: "Bar",
                            itemDescription: nil,
                            timestamp: 1456150025,
                            location: location)
        let itemManager = ItemManager()
        itemManager.add(item)
        sut.itemInfo = (itemManager, 0)
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertEqual(sut.locationLabel.text, "Foo")
    }
    
    func test_SettingItemInfo_SetsCoordinateLatitudeToLocationLabel() {
        let coordinate = CLLocationCoordinate2DMake(51.2277, 6.7735)
        let location = Location(name: "Foo", coordinate: coordinate)
        let item = ToDoItem(title: "Bar",
                            itemDescription: nil,
                            timestamp: 1456150025,
                            location: location)
        let itemManager = ItemManager()
        itemManager.add(item)
        sut.itemInfo = (itemManager, 0)
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertEqual(sut.mapView.centerCoordinate.latitude,
                                   coordinate.latitude,
                                   accuracy: 0.001)
    }
    
    func test_SettingItemInfo_SetsCoordinateLongitudeToLocationLabel() {
        let coordinate = CLLocationCoordinate2DMake(51.2277, 6.7735)
        let location = Location(name: "Foo", coordinate: coordinate)
        let item = ToDoItem(title: "Bar",
                            itemDescription: nil,
                            timestamp: 1456150025,
                            location: location)
        let itemManager = ItemManager()
        itemManager.add(item)
        sut.itemInfo = (itemManager, 0)
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertEqual(sut.mapView.centerCoordinate.longitude,
                                   coordinate.longitude,
                                   accuracy: 0.001)
    }

    func test_CheckItem_ChecksItemInItemManager() {
        let itemManager = ItemManager()
        itemManager.add(ToDoItem(title: "Foo"))
        sut.itemInfo = (itemManager, 0)
        sut.checkItem()
        XCTAssertEqual(itemManager.toDoCount, 0)
        XCTAssertEqual(itemManager.doneCount, 1)
    }
}

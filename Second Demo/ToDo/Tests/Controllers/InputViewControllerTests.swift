//
//  InputViewControllerTests.swift
//  Tests
//
//  Created by Martin Demiddel on 23.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDo

class InputViewControllerTests: XCTestCase {
    var sut: InputViewController!
    var placemark: MockPlacemark!

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
    
    func test_HasDateTextField() {
        let dateTextFieldIsSubView =
            sut.dateTextField?.isDescendant(
                of: sut.view) ?? false
        XCTAssertTrue(dateTextFieldIsSubView)
    }
    
    func test_HasLocationTextField() {
        let locationTextFieldIsSubView =
            sut.dateTextField?.isDescendant(
                of: sut.view) ?? false
        XCTAssertTrue(locationTextFieldIsSubView)
    }
    
    func test_HasAddressTextField() {
        let addressTextFieldIsSubView = sut.addressTextField?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(addressTextFieldIsSubView)
    }
    
    func test_HasDescriptionTextField() {
        let descriptionTextFieldIsSubView = sut.descriptionTextField?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(descriptionTextFieldIsSubView)
    }
    
    func test_HasSaveButton() {
        let saveButtonIsSubView = sut.saveButton?.isDescendant(of: sut.view) ?? false
        XCTAssertTrue(saveButtonIsSubView)
    }

    func test_Save_UsesGeocoderToGetCoordinateFromAddress() {
        let timestamp = 1456095600.0
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        sut.dateTextField.text = dateFormatter.string(from: date)

        sut.titleTextField.text = "Foo"
        sut.locationTextField.text = "Bar"
        sut.addressTextField.text = "Infinite Loop 1, Cupertino"
        sut.descriptionTextField.text = "Baz"

        let mockGeocoder = MockGeocoder()
        sut.geocoder = mockGeocoder
        sut.itemManager = ItemManager()
        sut.save()
        placemark = MockPlacemark()
        let coordinate = CLLocationCoordinate2DMake(37.3316851,
                                                    -122.0300674)
        placemark.mockCoordinate = coordinate
        mockGeocoder.completionHandler?([placemark], nil)

        let item = sut.itemManager?.item(at: 0)
        let testItem = ToDoItem(title: "Foo",
                                itemDescription: "Baz",
                                timestamp: timestamp,
                                location: Location(name: "Bar",
                                                   coordinate: coordinate))

        XCTAssertEqual(item, testItem)
    }

    func test_SaveButtonHasSaveAction() {
        let saveButton: UIButton = sut.saveButton
        guard let actions = saveButton.actions(
            forTarget: sut,
            forControlEvent: .touchUpInside) else {
                XCTFail(); return
        }

        XCTAssertTrue(actions.contains("save"))
    }

    func test_Geocoder_FetchesCoordinates() {
        let geocoderAnswered = expectation(description: "Geocoder")
        let address = "Infinite Loop 1, Cupertino"
        CLGeocoder()
            .geocodeAddressString(address) {
                (placemarks, error) -> Void in
                let coordinate =
                    placemarks?.first?.location?.coordinate
                guard let latitude =
                    coordinate?.latitude else {
                        XCTFail()
                        return
                }
                guard let longitude =
                    coordinate?.longitude else {
                        XCTFail()
                        return
                }

                XCTAssertEqual(latitude,
                               37.3316,
                               accuracy: 0.001)
                XCTAssertEqual(longitude,
                               -122.0300,
                               accuracy: 0.001)

                // when the async is fulfilled
                geocoderAnswered.fulfill()
        }

        // you need internet for this test
        // if the request takes longer than 3sec then the test will fail!
        waitForExpectations(timeout: 3,
                            handler: nil)
    }
}

extension InputViewControllerTests {
    class MockGeocoder: CLGeocoder {
        var completionHandler: CLGeocodeCompletionHandler?
        override func geocodeAddressString(
            _ addressString: String,
            completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler
        }
    }

    class MockPlacemark: CLPlacemark {
        var mockCoordinate: CLLocationCoordinate2D?
        override var location: CLLocation? {
            guard let coordinate = mockCoordinate else
            { return CLLocation() }
            return CLLocation(latitude: coordinate.latitude,
                              longitude: coordinate.longitude)
        }
    }
}


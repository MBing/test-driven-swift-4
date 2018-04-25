//
//  InputViewController.swift
//  ToDo
//
//  Created by Martin Demiddel on 23.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import UIKit
import CoreLocation

class InputViewController: UIViewController {
    lazy var geocoder = CLGeocoder()
    var itemManager: ItemManager?

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var saveButton: UIButton!

    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()

    // when adding IBAction with params, this will be saved in the actions as NAME: iso NAME ! So when testing, you need to look for something else then.
    @IBAction func save() {
        let titleString = titleTextField.text
        let dateText = dateTextField.text

        if (titleString?.isEmpty)! {
            return
        }
        var date: Date?

        if (dateText?.isEmpty)! {
            date = nil
        }
        date = dateFormatter.date(from: dateText!)

        let descriptionString = descriptionTextField.text
        if let locationName = locationTextField.text,
            locationName.count > 0 {
            if let address = addressTextField.text,
                address.count > 0 {
                geocoder.geocodeAddressString(address) {
                    [unowned self] (placeMarks, error) -> Void in
                    let placeMark = placeMarks?.first
                    let item = ToDoItem(
                        title: titleString!,
                        itemDescription: descriptionString,
                        timestamp: date?.timeIntervalSince1970,
                        location: Location(
                            name: locationName,
                            coordinate: placeMark?.location?.coordinate))
                    self.itemManager?.add(item)
                }
            }
        }
    }
}

//
//  ItemCell.swift
//  ToDo
//
//  Created by Martin Demiddel on 08.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(
        _ selected: Bool,
        animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(
        with item: ToDoItem,
        checked: Bool = false) {
        titleLabel.text = item.title
        locationLabel.text = item.location?.name

        if let timestamp = item.timestamp {
            let date = Date(timeIntervalSince1970: timestamp)
            dateLabel.text = dateFormatter.string(from: date)
        }
    }
}

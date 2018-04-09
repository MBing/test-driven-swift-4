//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Martin Demiddel on 08.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    var itemManager: ItemManager?
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        
        // we first check for nil and return if it is nil
        guard let itemManager = itemManager else {
            return 0
        }
        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }
        
        // when the enum is determinate, there's no problem not to have a default case
        switch itemSection {
        case .toDo:
            return itemManager.toDoCount
        case .done:
            return itemManager.doneCount
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ItemCell",
            for: indexPath) as! ItemCell
        
        // we first check for nil and return if it is nil
        guard let itemManager = itemManager else {
            fatalError()
        }
        guard let itemSection = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        let item: ToDoItem
        switch itemSection {
        case .toDo:
            item = itemManager.item(at: indexPath.row)
        case .done:
            item = itemManager.doneItem(at: indexPath.row)
        }
        
        cell.configCell(with: item)
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForDeleteConfirmationButtonForRowAt indexPath:
        IndexPath) -> String? {

        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }

        switch section {
        case .toDo:
            return "Check"
        case .done:
            return "Uncheck"
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath) {
        guard let itemManager = itemManager else { fatalError() }
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        switch section {
        case .toDo:
            itemManager.checkItem(at: indexPath.row)
        case .done:
            itemManager.uncheckItem(at: indexPath.row)
        }
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

enum Section: Int {
    case toDo
    case done
}

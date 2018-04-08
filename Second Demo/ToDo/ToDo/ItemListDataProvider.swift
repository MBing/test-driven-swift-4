//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Martin Demiddel on 08.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource {
    var itemManager: ItemManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemManager?.toDoCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Martin Demiddel on 05.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
}

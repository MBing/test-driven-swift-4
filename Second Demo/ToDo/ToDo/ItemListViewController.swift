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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
    }
}

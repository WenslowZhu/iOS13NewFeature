//
//  MainTableViewController.swift
//  iOS13NewFeature
//
//  Created by 朱廷 on 2019/6/26.
//  Copyright © 2019 朱廷. All rights reserved.
//

import UIKit

let mainTableViewCellIdentifier = "mainTableViewCellIdentifier"

class MainTableViewController: UITableViewController {

    let dataSource = ["Text", "Color", "Modal presentations", "Contextual menus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: mainTableViewCellIdentifier)
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainTableViewCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = dataSource[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

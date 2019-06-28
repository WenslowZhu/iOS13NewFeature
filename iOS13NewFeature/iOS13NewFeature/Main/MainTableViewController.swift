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

    let dataSource = ["Text", "Color", "Modal Presentations", "Contextual Menus Collection View", "Contextual Menus Table View", "Location", "Sign In With Apple"]
    
    lazy var storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: mainTableViewCellIdentifier)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mainTableViewCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = dataSource[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc: UIViewController
        
        switch indexPath.row {
        case 0:
            vc = storyBoard.instantiateViewController(withIdentifier: "TextViewController")
        case 1:
            vc = storyBoard.instantiateViewController(withIdentifier: "ColorCollectionViewController")
        case 2:
            vc = storyBoard.instantiateViewController(withIdentifier: "ModalPresentationsViewController")
        case 3:
            vc = storyBoard.instantiateViewController(withIdentifier: "ContextualMenusViewController")
        case 4:
            vc = storyBoard.instantiateViewController(withIdentifier: "ContextualMenusTableViewController")
        case 5:
            vc = storyBoard.instantiateViewController(withIdentifier: "LocationViewController")
        case 6:
            vc = SignInWithAppleViewController()
        default:
            vc = UIViewController()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "SECTION 1"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Test Footer Title"
    }
}

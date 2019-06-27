//
//  ModelPresentedViewController.swift
//  iOS13NewFeature
//
//  Created by tstone10 on 2019/6/27.
//  Copyright © 2019 朱廷. All rights reserved.
//

import UIKit

let ModelPresentedViewControllerIdentifier = "ModelPresentedViewControllerIdentifier"

class ModelPresentedViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ModelPresentedViewControllerIdentifier)
        
        if navigationController?.modalPresentationStyle == .fullScreen {
            title = "Full Screen"
        } else {
            title = "Page Sheet"
        }
        
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeSelf))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func closeSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ModelPresentedViewControllerIdentifier, for: indexPath)
        
        cell.textLabel?.text = "\(indexPath)"
        
        return cell
    }
}

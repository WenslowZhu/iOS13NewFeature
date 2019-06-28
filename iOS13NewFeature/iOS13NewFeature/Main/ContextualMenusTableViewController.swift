//
//  ContextualMenusTableViewController.swift
//  iOS13NewFeature
//
//  Created by tstone10 on 2019/6/28.
//  Copyright © 2019 朱廷. All rights reserved.
//

import UIKit

private let contextualMenusTableViewCellIdentifier = "contextualMenusTableViewCellIdentifier"

class ContextualMenusTableViewController: UITableViewController {

    let dataSource = [ContextualMenusTableViewData(image: UIImage(systemName: "pencil.tip"), title: "pencil.tip"),
                      ContextualMenusTableViewData(image: UIImage(systemName: "icloud"), title: "icloud"),
                      ContextualMenusTableViewData(image: UIImage(systemName: "phone.arrow.right"), title: "phone.arrow.right"),
                      ContextualMenusTableViewData(image: UIImage(systemName: "video"), title: "video"),
                      ContextualMenusTableViewData(image: UIImage(systemName: "envelope"), title: "envelope"),
                      ContextualMenusTableViewData(image: UIImage(systemName: "safari"), title: "safari")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contextualMenusTableViewCellIdentifier, for: indexPath) as! ContextualMenusTableViewCell

        cell.iconImageView.image = dataSource[indexPath.row].image
        cell.label.text = dataSource[indexPath.row].title
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { [weak self] (suggestedActions) -> UIMenu? in
            guard let self = self else { return nil }
            return self.makeContextMenu(indexPath: indexPath)
        }
    }
    
    func makeContextMenu(indexPath: IndexPath) -> UIMenu {
        
        let rename = UIAction(__title: "Rename Pupper", image: UIImage(systemName: "square.and.pencil"), options: []) { action in
            // Show rename UI
        }
        
        // Here we specify the "destructive" option to show that it’s destructive in nature
        let delete = UIAction(__title: "Delete Photo", image: UIImage(systemName: "trash"), options: .destructive) { action in
            // Delete this photo 😢
        }
        
        // The "title" will show up as an action for opening this menu
        let edit = UIMenu(__title: "Edit...", image: nil, identifier: nil, options: [], children: [rename, delete])
        
        
        // Create a UIAction for sharing
        let share = UIAction(__title: "Share Pupper", image: UIImage(systemName: "square.and.arrow.up"), options: []) { [weak self] action in
            let ac = UIActivityViewController(activityItems: [UIImage(named: "IMG_0961")!], applicationActivities: nil)
            self?.present(ac, animated: true, completion: nil)
        }
        
        // Create and return a UIMenu with the share action
        return UIMenu(__title: "", image: nil, identifier: nil, options: [], children: [share, edit])
    }
}

struct ContextualMenusTableViewData {
    let image: UIImage?
    let title: String
}

class ContextualMenusTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
}

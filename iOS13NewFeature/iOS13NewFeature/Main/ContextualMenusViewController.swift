//
//  ContextualMenusViewController.swift
//  iOS13NewFeature
//
//  Created by tstone10 on 2019/6/28.
//  Copyright © 2019 朱廷. All rights reserved.
//

import UIKit

private let contextualMenusCellIdentifier = "contextualMenusCellIdentifier"

class ContextualMenusViewController: UICollectionViewController {
    
    let dataSource = ["IMG_0010",
                      "IMG_0011",
                      "IMG_0012",
                      "IMG_0077",
                      "IMG_0572",
                      "IMG_0961",
                      "IMG_1770",
                      "IMG_1874",
                      "IMG_2318",
                      "IMG_8649"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 120, height: 120)
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumInteritemSpacing = 5
        collectionViewLayout.minimumLineSpacing = 5
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contextualMenusCellIdentifier, for: indexPath) as! ContextualMenusCollectionCell
        
        cell.imageName = dataSource[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: { [weak self] in
            guard let self = self else { return nil }
            return PupperPreviewViewController(image: UIImage(named: self.dataSource[indexPath.row])!)
        }) { [weak self] (suggestedActions) -> UIMenu? in
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

class ContextualMenusCollectionCell: UICollectionViewCell {
    var imageName: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.imageView.image = UIImage(named: self.imageName)
            }
        }
    }
    @IBOutlet weak var imageView: UIImageView!
}

class PupperPreviewViewController: UIViewController {
    private let imageView = UIImageView()
    
    override func loadView() {
        view = imageView
    }
    
    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = image

        preferredContentSize = image.size
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

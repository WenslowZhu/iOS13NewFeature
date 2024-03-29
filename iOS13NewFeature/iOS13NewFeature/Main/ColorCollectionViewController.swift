//
//  ColorCollectionViewController.swift
//  iOS13NewFeature
//
//  Created by tstone10 on 2019/6/27.
//  Copyright © 2019 朱廷. All rights reserved.
//

import UIKit

private let colorCollectionViewCellIdentifier = "ColorCollectionViewCellIdentifier"

class ColorCollectionViewController: UICollectionViewController {

    let dataSource = [ColorData(name: "systemGreen", color: .systemGreen),
                      ColorData(name: "systemBlue", color: .systemBlue),
                      ColorData(name: "systemPink", color: .systemPink),
                      ColorData(name: "systemGray", color: .systemGray),
                      ColorData(name: "systemRed", color: .systemRed),
                      ColorData(name: "systemFill", color: .systemFill),
                      ColorData(name: "systemTeal", color: .systemTeal),
                      ColorData(name: "systemGray", color: .systemGray),
                      ColorData(name: "systemIndigo", color: .systemIndigo),
                      ColorData(name: "systemOrange", color: .systemOrange),
                      ColorData(name: "systemPurple", color: .systemPurple),
                      ColorData(name: "systemYellow", color: .systemYellow)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 100, height: 120)
        collectionViewLayout.scrollDirection = .vertical
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colorCollectionViewCellIdentifier, for: indexPath) as! ColorCollectionViewCell
    
        cell.colorView.backgroundColor = dataSource[indexPath.row].color
        cell.colorLabel.text = dataSource[indexPath.row].name
        
        return cell
    }
}

struct ColorData {
    let name: String
    let color: UIColor
}

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorLabel: UILabel!
}

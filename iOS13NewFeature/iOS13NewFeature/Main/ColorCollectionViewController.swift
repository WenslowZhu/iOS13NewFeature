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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 100, height: 120)
        collectionViewLayout.scrollDirection = .vertical

        collectionView.collectionViewLayout = collectionViewLayout
        
//        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: colorCollectionViewCellIdentifier)

//        collectionView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colorCollectionViewCellIdentifier, for: indexPath) as! ColorCollectionViewCell
    
        // Configure the cell
        cell.colorView.backgroundColor = dataSource[indexPath.row].color
        cell.colorLabel.text = dataSource[indexPath.row].name
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

struct ColorData {
    let name: String
    let color: UIColor
}

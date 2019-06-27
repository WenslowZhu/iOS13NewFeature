//
//  ModalPresentationsViewController.swift
//  iOS13NewFeature
//
//  Created by tstone10 on 2019/6/27.
//  Copyright © 2019 朱廷. All rights reserved.
//

import UIKit

class ModalPresentationsViewController: UIViewController {

    lazy var storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    @IBAction func fullScreen(_ sender: Any) {
        presentVC(style: .fullScreen)
    }
    
    @IBAction func pageSheet(_ sender: Any) {
        presentVC(style: .automatic)
    }
    
    @IBAction func enterWebView(_ sender: Any) {
        let vc = storyBoard.instantiateViewController(withIdentifier: "WebViewController")
        present(vc, animated: true, completion: nil)
    }
    
    func presentVC(style: UIModalPresentationStyle) {
        let vc = storyBoard.instantiateViewController(withIdentifier: "ModelPresentedViewController")
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = style
        
        present(nav, animated: true, completion: nil)
    }
}

//
//  WebViewController.swift
//  iOS13NewFeature
//
//  Created by tstone10 on 2019/6/27.
//  Copyright © 2019 朱廷. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.load(URLRequest(url: URL(string: "https://www.bing.com")!))
    }
}

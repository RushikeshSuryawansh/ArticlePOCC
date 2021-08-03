//
//  ArticleWebViewController.swift
//  iosApp
//
//  Created by Rushikesh on 03/08/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController {

    var articleUrl = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: articleUrl)
        webView.load(URLRequest(url: url!))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnCliked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

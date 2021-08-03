//
//  DesriptionViewController.swift
//  iosApp
//
//  Created by Rushikesh on 03/08/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import UIKit
import shared

class DesriptionViewController: UIViewController {

    @IBOutlet weak var imgViewOutlet: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var desriptionLbl: UILabel!
    
    var titleString = ""
    var desriptionString = ""
    var articleImageUrl = ""
    var articleUrl = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataToUI()
    }
    
    func loadDataToUI() {
        imgViewOutlet.round()
        titleLbl.text = titleString
        desriptionLbl.text = desriptionString
        let url = URL(string: articleImageUrl)!
        let data = try? Data(contentsOf: url)

        if let imageData = data {
            let imageFromUrl = UIImage(data: imageData)
            imgViewOutlet.image = imageFromUrl
        }
    }
    
    @IBAction func backBtnCliked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func readArticleBtnClicked(_ sender: Any) {
        let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ArticleWebViewController") as! ArticleWebViewController
        webVC.articleUrl = articleUrl
        self.navigationController?.pushViewController(webVC, animated: true)    }
    
}

//
//  ArticleListViewController.swift
//  iosApp
//
//  Created by Rushikesh on 29/07/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import UIKit
import shared

class ArticleListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier = "ArticleTableViewCell"
    
    var api: ArticleAPI!
    
    var articleList: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api = ArticleAPI()

        tableView.dataSource = self
        tableView.delegate = self
        loadList()
        // Do any additional setup after loading the view.
    }
    

    func loadList() {
      api.getArticleList(success: { articles in
        self.articleList = articles
        self.tableView.reloadData()
      }, failure: { error in
        print(error?.description() ?? "")
      })
    }

}

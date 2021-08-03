//
//  Extension.swift
//  iosApp
//
//  Created by Rushikesh on 29/07/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import Foundation
import UIKit

extension ArticleListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let articleData = articleList[indexPath.row]
    let desVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DesriptionViewController") as! DesriptionViewController
    desVC.titleString = articleData.title ?? ""
    desVC.desriptionString = articleData.abstract ?? ""
    desVC.articleUrl = articleData.url ?? ""
    desVC.articleImageUrl = articleList[indexPath.row].media?[0].MediaMetadata?[0].url ?? ""
    self.navigationController?.pushViewController(desVC, animated: true)
    tableView.reloadRows(at: [indexPath], with: .automatic)
  }
}

extension ArticleListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articleList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ArticleTableViewCell
    let imageUrl = articleList[indexPath.row].media?[0].MediaMetadata?[0].url
    let artcileData = articleList[indexPath.row]
    cell.articleTitleLbl.text = artcileData.title
    cell.articleAuuthorLabel.text = artcileData.byline
    api.getImage(url: imageUrl ?? "", success: { image in
      DispatchQueue.main.async {
        cell.articleImageView.image = image
        cell.setNeedsLayout()
      }
    }, failure: { error in
      print(error?.description() ?? "")
    })
    cell.articleImageView.layer.cornerRadius = cell.articleImageView.frame.width/2.0
    cell.articleImageView.layer.masksToBounds = true
    
    return cell
  }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension UIImageView{
    func round(){
        self.layer.cornerRadius = self.frame.width/2.0
        self.layer.masksToBounds = true
    }
}

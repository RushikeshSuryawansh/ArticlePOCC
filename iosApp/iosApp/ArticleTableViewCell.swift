//
//  ArticleTableViewCell.swift
//  iosApp
//
//  Created by Rushikesh on 03/08/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleTitleLbl: UILabel!
    @IBOutlet weak var articleAuuthorLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

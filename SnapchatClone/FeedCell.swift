//
//  FeedCell.swift
//  SnapchatClone
//
//  Created by MacxbookPro on 23.03.2020.
//  Copyright © 2020 MacxbookPro. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var feedUsername: UILabel!
    
    @IBOutlet weak var feedImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

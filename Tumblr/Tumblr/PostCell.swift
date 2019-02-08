//
//  PostCell.swift
//  Tumblr
//
//  Created by Yash Mahajan on 2/1/19.
//  Copyright © 2019 Yash Mahajan. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var photo: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

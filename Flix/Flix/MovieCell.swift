//
//  MovieCell.swift
//  Flix
//
//  Created by Yash Mahajan on 2/8/19.
//  Copyright © 2019 Yash Mahajan. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MoviePoster: UIImageView!
    @IBOutlet weak var MovieDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

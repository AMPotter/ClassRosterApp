//
//  PersonTableViewCell.swift
//  ClassRoster
//
//  Created by Andrew Potter on 11/24/14.
//  Copyright (c) 2014 Andrew Potter. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var studentLabel: UILabel!
    @IBOutlet var personImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

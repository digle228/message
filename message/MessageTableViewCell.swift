//
//  MessageTableViewCell.swift
//  message
//
//  Created by wusuchen on 2016/1/11.
//  Copyright © 2016年 ac. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    @IBOutlet weak var dateAndTime: UILabel!

    @IBOutlet weak var content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

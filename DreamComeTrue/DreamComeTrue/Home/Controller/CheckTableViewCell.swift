//
//  CheckTableViewCell.swift
//  DreamComeTrue
//
//  Created by 水蒸气很快乐 on 16/10/12.
//  Copyright © 2016年 水蒸气很快乐. All rights reserved.
//

import UIKit

class CheckTableViewCell: UITableViewCell
{
        @IBOutlet weak var DateLabel: UILabel!
        @IBOutlet weak var TimeLabel: UILabel!
        @IBOutlet weak var GoalLabel: UILabel!
        @IBOutlet weak var MoneyLabel: UILabel!

    override func awakeFromNib()
    {
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

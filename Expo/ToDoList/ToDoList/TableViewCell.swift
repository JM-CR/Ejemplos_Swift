//
//  TableViewCell.swift
//  ToDoList
//
//  Created by José Castellanos Ramos on 11/7/19.
//  Copyright © 2019 José Castellanos Ramos. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  donecellTableViewCell.swift
//  ToDoApp2
//
//  Created by Kan Nakamura on 2019/01/18.
//  Copyright © 2019 Kan Nakamura. All rights reserved.
//

import UIKit

class donecellTableViewCell: UITableViewCell {

    @IBOutlet weak var donelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

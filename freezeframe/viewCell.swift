//
//  viewCell.swift
//  freezeframe
//
//  Created by Alex on 21.03.17.
//  Copyright © 2017 AnsA. All rights reserved.
//

import UIKit

class viewCell: UITableViewCell {

    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var textData: UILabel!
    @IBOutlet weak var  cellImage : UIImageView!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

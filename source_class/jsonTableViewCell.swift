//
//  jsonTableViewCell.swift
//  login
//
//  Created by simplogics on 22/02/19.
//  Copyright © 2019 simplogics. All rights reserved.
//

import UIKit

class jsonTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var m_lblnews: UILabel!
    @IBOutlet weak var m_imgnews: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  EmployerMessagesCell.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 26/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployerMessagesCell: UITableViewCell {

    @IBOutlet weak var senderId: UILabel!
    @IBOutlet weak var messageContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  MyJobsCell.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 23/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class MyJobsCell: UITableViewCell {

    @IBOutlet weak var Container: UIView!
    @IBOutlet weak var MyJobImage: UIImageView!
    @IBOutlet weak var MyJobName: UILabel!
    @IBOutlet weak var MyJobPosition: UILabel!
    @IBOutlet weak var MyJobLocation: UILabel!
    @IBOutlet weak var MyJobShift: UILabel!
    @IBOutlet weak var MyJobStatus: UILabel!
    @IBOutlet weak var MyJobDate: UILabel!
    @IBOutlet weak var MyJobPay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
           Container.layer.cornerRadius = 10
           MyJobImage.layer.masksToBounds = true
           Container.clipsToBounds = true
       }
    
}

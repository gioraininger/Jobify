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
        
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 5, height: 3)
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.masksToBounds = false
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Allow smoother scrolling with drop shadow implemented
      cell.contentView.layer.masksToBounds = true
      let radius = cell.contentView.layer.cornerRadius
      cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
        
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

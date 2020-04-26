//
//  MyAdsCell.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 23/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class MyAdsCell: UITableViewCell {

    @IBOutlet weak var Container: UIView!
    @IBOutlet weak var MyAdsImage: UIImageView!
    @IBOutlet weak var MyAdsName: UILabel!
    @IBOutlet weak var MyAdsPosition: UILabel!
    @IBOutlet weak var MyAdsPay: UILabel!
    @IBOutlet weak var MyAdsDate: UILabel!
    @IBOutlet weak var MyAdsShift: UILabel!
    @IBOutlet weak var Edit: UIButton!
    @IBOutlet weak var Applicants: UIButton!
    @IBOutlet weak var Delete: UIButton!
    
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
        MyAdsImage.layer.masksToBounds = true
        Container.clipsToBounds = true
        
        Delete.layer.cornerRadius = 10
        Delete.clipsToBounds = true
        
        Edit.layer.cornerRadius = 10
        Edit.clipsToBounds = true
       
        Applicants.layer.cornerRadius = 15
        Applicants.clipsToBounds = true

    }
}

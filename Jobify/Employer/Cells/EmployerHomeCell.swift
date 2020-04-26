//
//  EmployerHomeCell.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 22/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployerHomeCell: UITableViewCell {

    @IBOutlet weak var Container: UIView!
    @IBOutlet weak var EmployerHomeImage: UIImageView!
    @IBOutlet weak var EmployerHomeName: UILabel!
    @IBOutlet weak var EmployerHomePosition: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var EmployerHomeLocation: UILabel!
    @IBOutlet weak var Salary: UILabel!
    @IBOutlet weak var EmployerHomeSalary: UILabel!
    @IBOutlet weak var Hire: UIButton!
    @IBOutlet weak var Contact: UIButton!
    
    var delegate: CellSegueProtocol!

    
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
        EmployerHomeImage.layer.masksToBounds = true
        Container.clipsToBounds = true
        
        Contact.layer.cornerRadius = 10
        Contact.clipsToBounds = true
        
        Hire.layer.cornerRadius = 10
        Hire.clipsToBounds = true
        
    }
    
    @IBAction func buttonPressed(sender:AnyObject){
           var mydata = "Anydata you want to send to the next controller"
           if(self.delegate != nil){ //Just to be safe.
            self.delegate.callSegueFromCell(myData: mydata as AnyObject)
           }
        
    }
}


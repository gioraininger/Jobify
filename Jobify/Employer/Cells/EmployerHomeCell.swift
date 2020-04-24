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


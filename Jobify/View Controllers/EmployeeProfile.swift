//
//  EmployeeProfile.swift
//  DuIt
//
//  Created by Giovanni  Raininger  on 03/12/2019.
//  Copyright © 2019 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployeeProfile: UIViewController {
    
    

    @IBOutlet weak var profilePhoto: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
    }
    
    
    @IBAction func ProfileSettings(_ sender: UIButton) {
        
        
    }
    
    func setupButtons() {

        
        profilePhoto.layer.cornerRadius = profilePhoto.frame.height / 2
    }

    
    
}

//
//  EmployeeProfile.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 24/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation
import UIKit

class EmployeeProfile: UIViewController, UITableViewDelegate {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var financeView: UIView!
    @IBOutlet weak var helpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        financeView.isHidden = true
        helpView.isHidden = true
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            profileView.isHidden = false
            financeView.isHidden = true
            helpView.isHidden = true
        case 1:
            profileView.isHidden = true
            financeView.isHidden = false
            helpView.isHidden = true
        case 2:
        profileView.isHidden = true
        financeView.isHidden = true
        helpView.isHidden = false
        default:
            break;
        }
    }
}

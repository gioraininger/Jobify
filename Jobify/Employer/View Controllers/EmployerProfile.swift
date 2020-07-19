//
//  EmployerProfile.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 24/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class EmployerProfile: UIViewController, UITableViewDelegate {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var helpView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView.isHidden = true
        helpView.isHidden = true
    }
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            profileView.isHidden = false
            settingsView.isHidden = true
            helpView.isHidden = true
        case 1:
            profileView.isHidden = true
            settingsView.isHidden = false
            helpView.isHidden = true
        case 2:
        profileView.isHidden = true
        settingsView.isHidden = true
        helpView.isHidden = false
        default:
            break;
        }
    }
}


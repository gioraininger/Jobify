//
//  EmployeeProfilePage.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 25/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation
import UIKit
import Firebase


class EmployeeProfilePage: UIViewController, UITableViewDelegate {

    @IBOutlet weak var firstName: UILabel!
    
    var employeeName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstName.text = AppSettings.getFirstName()
    }
}

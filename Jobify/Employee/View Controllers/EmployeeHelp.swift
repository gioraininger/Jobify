//
//  EmployeeHelp.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 30/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation
import UIKit

class EmployeeHelp: UIViewController{
    
    @IBOutlet weak var curvedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curvedView.addBottomRoundedEdge(desiredCurve: 1)
    }
}

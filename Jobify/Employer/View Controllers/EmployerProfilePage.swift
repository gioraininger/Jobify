//
//  EmployerProfilePage.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 25/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation
import UIKit
import Firebase


class EmployerProfilePage: UIViewController, UITableViewDelegate {

    @IBOutlet weak var businessName: UILabel!
    var employerName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        businessName.text = AppSettings.getName()
    }
    

/*
    init?(snapshot: DataSnapshot) {

    guard let employerName = snapshot.childSnapshot(forPath: "names").value as? String,
        else do { return nil }

    self.employerName = employerName
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}
  */
}


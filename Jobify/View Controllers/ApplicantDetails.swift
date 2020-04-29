//
//  ApplicantDetails.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 22/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation
import UIKit

class ApplicantDetails: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfEmployes:[EmployerHomeModel] = [EmployerHomeModel]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupClearNavigationBarWithTitle()
        

        tableView.register(UINib.init(nibName: ApplicantDetailsCell.nibName, bundle: nil), forCellReuseIdentifier: ApplicantDetailsCell.nibName)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ApplicantDetailsCell.nibName, for: indexPath) as! ApplicantDetailsCell
        
        cell.selectionStyle = .none

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        950
    }
 
       
}



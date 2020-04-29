//
//  EmployerDetails.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 23/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation
import UIKit

class BusinessDetails: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfEmployers:[EmployerHomeModel] = [EmployerHomeModel]()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            self.tableView.delegate = self
            self.tableView.dataSource = self
            
            setupClearNavigationBarWithTitle()
            

            tableView.register(UINib.init(nibName: BusinessDetailsCell.nibName, bundle: nil), forCellReuseIdentifier: BusinessDetailsCell.nibName)
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
           
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: BusinessDetailsCell.nibName, for: indexPath) as! BusinessDetailsCell
            
            cell.selectionStyle = .none

            return cell
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            950
        }
     
           
    }





//
//  EmployeeHome.swift
//  DuIt
//
//  Created by Giovanni  Raininger  on 03/12/2019.
//  Copyright © 2019 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployeeHome: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    
    let employerHomeCellId = "EmployerHomeCell"
    @IBOutlet weak var tableView: UITableView!
    var employers = [EmployerHomeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupClearNavigationBarWithTitle()
        
        tableView.register(UINib.init(nibName: employerHomeCellId, bundle: nil), forCellReuseIdentifier: employerHomeCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        
        employers = DummyDataGenerator().getEmployerData()
        
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: employerHomeCellId, for: indexPath) as! EmployerHomeCell
        cell.selectionStyle = .none
        let employer = employers[indexPath.row]
        cell.EmployerHomeName.text = employer.name!
        cell.EmployerHomePosition.text = employer.desc!
        cell.EmployerHomeImage.image = employer.image
        cell.EmployerHomeLocation.text = employer.location!
        cell.EmployerHomeSalary.text = employer.salary!
        cell.Salary.text = "Pay"
        cell.Hire.setTitle("Apply", for: .normal)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employers.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
        let e = employers[indexPath.row]
        performSegue(withIdentifier: "BusinessDetails", sender: e)
    }
}

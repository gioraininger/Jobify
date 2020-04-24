//
//  EmployerHome.swift
//  DuIt
//
//  Created by Giovanni  Raininger  on 09/03/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployerHome: UIViewController, UITableViewDataSource, UITableViewDelegate, CellSegueProtocol {
    
    let employerHomeCellId = "EmployerHomeCell"
    @IBOutlet weak var tableView: UITableView!
    var employees = [EmployerHomeModel]()
    
    var arrayOfApplicants:[EmployerHomeModel] = [EmployerHomeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupClearNavigationBarWithTitle()
        
        // register cell
        tableView.register(UINib.init(nibName: employerHomeCellId, bundle: nil), forCellReuseIdentifier: employerHomeCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        
        employees = DummyDataGenerator().getEmployeeData()
                
        tableView.reloadData()
            
    }
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: employerHomeCellId, for: indexPath) as! EmployerHomeCell
        cell.selectionStyle = .none
        let employee = employees[indexPath.row]
        cell.EmployerHomeName.text = employee.name!
        cell.EmployerHomePosition.text = employee.desc!
        cell.EmployerHomeImage.image = employee.image
        cell.EmployerHomeLocation.text = employee.location!
        cell.EmployerHomeSalary.text = employee.salary!
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let employee = employees[indexPath.row]
  //  }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
        
        
        let e = employees[indexPath.row]
        performSegue(withIdentifier: "ApplicantDetails", sender: e)
    }
    
    func callSegueFromCell(myData dataobject: AnyObject) {
      //try not to send self, just to avoid retain cycles(depends on how you handle the code on the next controller)
        self.performSegue(withIdentifier: "contact", sender:dataobject )

    }
}



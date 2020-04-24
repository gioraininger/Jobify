//
//  Applicants.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 24/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployerApplicants: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    let employerApplicantsCellId = "EmployerHomeCell"
    @IBOutlet weak var tableView: UITableView!
    
    var applicants = [EmployerHomeModel]()
        
    var arrayOfApplicants:[EmployerHomeModel] = [EmployerHomeModel]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupClearNavigationBarWithTitle()
        
        // register cell
        tableView.register(UINib.init(nibName: employerApplicantsCellId, bundle: nil), forCellReuseIdentifier: employerApplicantsCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
                        
        tableView.reloadData()
            
    }
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: employerApplicantsCellId, for: indexPath) as! EmployerHomeCell
        cell.selectionStyle = .none
        let applicant = applicants[indexPath.row]
        cell.EmployerHomeName.text = applicant.name!
        cell.EmployerHomePosition.text = applicant.desc!
        cell.EmployerHomeImage.image = applicant.image
        cell.EmployerHomeLocation.text = applicant.location!
        cell.EmployerHomeSalary.text = applicant.salary!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicants.count
    }
    
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let employee = employees[indexPath.row]
  //  }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
        
        
        let e = applicants[indexPath.row]
        performSegue(withIdentifier: "", sender: e)
    }
    
    func callSegueFromCell(myData dataobject: AnyObject) {
      //try not to send self, just to avoid retain cycles(depends on how you handle the code on the next controller)
        self.performSegue(withIdentifier: "", sender:dataobject )

    }
}



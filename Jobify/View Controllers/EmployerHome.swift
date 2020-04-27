//
//  EmployerHome.swift
//  DuIt
//
//  Created by Giovanni  Raininger  on 09/03/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployerHome: UIViewController, UITableViewDataSource, UITableViewDelegate, CellSegueProtocol, UISearchBarDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nullSearch: UILabel!
    @IBOutlet weak var tryAgain: UILabel!
    
    let employerHomeCellId = "EmployerHomeCell"
    @IBOutlet weak var tableView: UITableView!
    var employees = [EmployerHomeModel]()
    
    var arrayOfApplicants:[EmployerHomeModel] = [EmployerHomeModel]()
    var filteredResults = [EmployerHomeModel]()
    var emptyFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: self, action: nil)
       // navigationItem.backBarButtonItem = backButton

          searchBar.delegate = self
         // searchBar.backgroundColor = UIColor.lightGray
          //searchBar.isTranslucent = true
         // searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        
      
        
       

        
        hideKeyboardWhenTappedAround()
        
        setupClearNavigationBarWithTitle()
        
        // register cell
        tableView.register(UINib.init(nibName: employerHomeCellId, bundle: nil), forCellReuseIdentifier: employerHomeCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        
        employees = DummyDataGenerator().getEmployeeData()
                
        tableView.reloadData()
            
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if filteredResults.isEmpty {
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
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: employerHomeCellId, for: indexPath) as! EmployerHomeCell
            cell.selectionStyle = .none
            let employee = filteredResults[indexPath.row]
            cell.EmployerHomeName.text = employee.name!
            cell.EmployerHomePosition.text = employee.desc!
            cell.EmployerHomeImage.image = employee.image
            cell.EmployerHomeLocation.text = employee.location!
            cell.EmployerHomeSalary.text = employee.salary!
            cell.delegate = self
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if emptyFlag {
            emptyFlag = false
            nullSearch.isHidden = false
            tryAgain.isHidden = false
            return 0
        } else {
            if filteredResults.isEmpty {
                nullSearch.isHidden = true
                tryAgain.isHidden = true
                return employees.count
            } else {
                return filteredResults.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
        
        
        let e = employees[indexPath.row]
        performSegue(withIdentifier: "ApplicantDetails", sender: e)
    }
    
    func callSegueFromCell(myData dataobject: AnyObject) {
      //try not to send self, just to avoid retain cycles(depends on how you handle the code on the next controller)
        self.performSegue(withIdentifier: "contact", sender:dataobject )

    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let searchtext = searchBar.text else {
            return
        }
    
        if searchtext == "" {
            tableView.reloadData()
            return
        }
        
        for employee in employees {
            if let desc = employee.desc {
                if desc.caseInsensitiveCompare(searchtext) == .orderedSame {
                    filteredResults.append(employee)
                    
                }
            }
        }
        if filteredResults.count == 0 {
            emptyFlag = true
        }
        
        tableView.reloadData {
            self.filteredResults.removeAll()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredResults.removeAll()
            tableView.reloadData()
        }
    }
}


extension UITableView {
    func reloadData(completion:@escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
            { _ in completion() }
    }
}


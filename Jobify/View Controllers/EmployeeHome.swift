//
//  EmployeeHome.swift
//  DuIt
//
//  Created by Giovanni  Raininger  on 03/12/2019.
//  Copyright © 2019 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployeeHome: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UITextFieldDelegate, CellSegueProtocol  {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nullSearch: UILabel!
    @IBOutlet weak var tryAgain: UILabel!
    
    let employerHomeCellId = "EmployerHomeCell"
    @IBOutlet weak var tableView: UITableView!
    var employers = [EmployerHomeModel]()
    
    var arrayOfEmployers:[EmployerHomeModel] = [EmployerHomeModel]()
    var filteredResults = [EmployerHomeModel]()
    var emptyFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        // searchBar.backgroundColor = UIColor.lightGray
         //searchBar.isTranslucent = true
        // searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        
        
        
        
        hideKeyboardWhenTappedAround()
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
        if filteredResults.isEmpty {
         let cell = tableView.dequeueReusableCell(withIdentifier: employerHomeCellId, for: indexPath) as! EmployerHomeCell
        cell.selectionStyle = .none
        let employer = employers[indexPath.row]
        cell.EmployerHomeName.text = employer.name!
        cell.EmployerHomePosition.text = employer.desc!
        cell.EmployerHomeImage.image = employer.image
        cell.EmployerHomeLocation.text = employer.location!
        cell.EmployerHomeSalary.text = employer.salary!
        cell.delegate = self
        cell.Salary.text = "Pay"
        cell.Hire.setTitle("Apply", for: .normal)
        return cell
    }else {
        let cell = tableView.dequeueReusableCell(withIdentifier: employerHomeCellId, for: indexPath) as! EmployerHomeCell
        cell.selectionStyle = .none
        let employer = filteredResults[indexPath.row]
        cell.EmployerHomeName.text = employer.name!
        cell.EmployerHomePosition.text = employer.desc!
        cell.EmployerHomeImage.image = employer.image
        cell.EmployerHomeLocation.text = employer.location!
        cell.EmployerHomeSalary.text = employer.salary!
        cell.Salary.text = "Pay"
        cell.Hire.setTitle("Apply", for: .normal)
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
                return employers.count
            } else {
                return filteredResults.count
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
        
        let e = employers[indexPath.row]
        performSegue(withIdentifier: "BusinessDetailsCell", sender: e)
    }
    
    func callSegueFromCell(myData dataobject: AnyObject) {
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
            
            for employer in employers {
                if let desc = employer.desc {
                    if desc.caseInsensitiveCompare(searchtext) == .orderedSame {
                        filteredResults.append(employer)
                        
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


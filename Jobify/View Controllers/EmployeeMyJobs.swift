//
//  EmployeeMyJobs.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 23/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//
import UIKit

class EmployeeMyJobs: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    let myJobsCellId = "MyJobsCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var jobs = [MyJobsModel]()
    
    var arrayOfJobs:[MyJobsModel] = [MyJobsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupClearNavigationBarWithTitle()
        
        tableView.register(UINib.init(nibName: myJobsCellId, bundle: nil), forCellReuseIdentifier: myJobsCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        
        jobs = DummyDataGenerator().getMyJobsData()
        
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myJobsCellId, for: indexPath) as! MyJobsCell
        cell.selectionStyle = .none
        let job = jobs[indexPath.row]
        cell.MyJobName.text = job.name!
        cell.MyJobPosition.text = job.position!
        cell.MyJobLocation.text = job.location
        cell.MyJobImage.image = job.image
        cell.MyJobShift.text = job.shift!
        cell.MyJobStatus.text = job.status!
        cell.MyJobPay.text = job.pay!
        cell.MyJobDate.text = job.date!
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
        
        let e = jobs[indexPath.row]
        performSegue(withIdentifier: "MyJobs", sender: e)
    }
   
}

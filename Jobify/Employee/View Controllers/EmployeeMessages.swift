//
//  EmployeeMessages.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 26/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployeeMessages: UIViewController, UITableViewDelegate, UITableViewDataSource {

     let employeeMessagesCellId = "EmployerMessagesCell"
    @IBOutlet weak var tableView: UITableView!
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: employeeMessagesCellId, bundle: nil), forCellReuseIdentifier: employeeMessagesCellId)
        tableView.rowHeight = UITableView.automaticDimension
        
        let uid = AppSettings.getUid()
        messages = AppSettings.getMessages(userId: uid)
                
        tableView.reloadData()
    
        

    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: employeeMessagesCellId, for: indexPath) as! EmployerMessagesCell
        cell.selectionStyle = .none
        let message = messages[indexPath.row]
        cell.senderId.text = message.senderId!
        cell.messageContent.text = message.messageBody!
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

}

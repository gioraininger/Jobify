//
//  EmployerMessages.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 25/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployerMessages: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    let employerMessagesCellId = "EmployerMessagesCell"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageName: UILabel!
    var contactName: String?
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageName.text = AppSettings.getName()
        
        
        tableView.register(UINib.init(nibName: employerMessagesCellId, bundle: nil), forCellReuseIdentifier: employerMessagesCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        
        let uid = AppSettings.getUid()
        messages = AppSettings.getMessages(userId: uid)
                
        tableView.reloadData()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: employerMessagesCellId, for: indexPath) as! EmployerMessagesCell
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

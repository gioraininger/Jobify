//
//  EmployerMyAds.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 23/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class EmployerMyAds: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    let myAdsCellId = "MyAdsCell"
    
    @IBOutlet weak var tableView: UITableView!
    var ads = [MyAdsModel]()
    
    var arrayOfAds:[MyAdsModel] = [MyAdsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupClearNavigationBarWithTitle()
        
        tableView.register(UINib.init(nibName: myAdsCellId, bundle: nil), forCellReuseIdentifier: myAdsCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        
        ads = DummyDataGenerator().getMyAdsData()
        
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myAdsCellId, for: indexPath) as! MyAdsCell
        cell.selectionStyle = .none
        let ad = ads[indexPath.row]
        cell.MyAdsName.text = ad.name!
        cell.MyAdsPosition.text = ad.position!
        cell.MyAdsImage.image = ad.image
        cell.MyAdsShift.text = ad.shift!
        cell.MyAdsPay.text = ad.pay!
        cell.MyAdsDate.text = ad.date!
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ads.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let applicants = ads[indexPath.row].applicants
        performSegue(withIdentifier: "MyAd", sender: applicants)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let applicants = sender as? [EmployerHomeModel]? {
            let vc = segue.destination as! EmployerApplicants
            vc.applicants = applicants!
        }
    }
    
    
    
}

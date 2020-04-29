//
//  EmployerProfilePage.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 25/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase


class EmployerProfilePage: UIViewController, UITableViewDelegate {
    var accounts = [Account]()

    @IBOutlet weak var curvedView: UIView!
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var businessName: UILabel!
    var employerName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        businessName.text = AppSettings.getName()
        getImage()
        curvedView.addBottomRoundedEdge(desiredCurve: 3)
     //   let account = Account(photoUrlString: "TEEEEEEEST")
     //   print(account.profilePhotoUrl)
    }
    
    
    
    func getImage(){
        let ref = Database.database().reference()

        ref.child("users").child(AppSettings.getUid()).observeSingleEvent(of: .value, with: { (snapshot) in
              
            let value = snapshot.value as? NSDictionary
            
            guard let imageURL = value?["profilePhotoUrl"] as? String else {
                return
            }
            
            guard let url = URL(string: imageURL) else {
                return
            }

            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.photoProfile.image = image
                    }
                }
            }

          }) { (error) in
            // FIXME: Alert the user image retrieval has been unsuccessful
            print(error.localizedDescription)
        }
    }
    
}


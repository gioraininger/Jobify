//
//  EmployeeProfilePage.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 25/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase


class EmployeeProfilePage: UIViewController, UITableViewDelegate {

    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var curvedView: UIView!
    @IBOutlet weak var firstName: UILabel!
    
    var employeeName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstName.text = AppSettings.getFirstName()
        getImage()
        curvedView.addBottomRoundedEdge(desiredCurve: 3)
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

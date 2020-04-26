//
//  JobifyPage.swift
//  DuIt
//
//  Created by Giovanni  Raininger  on 03/12/2019.
//  Copyright © 2019 Giovanni  Raininger . All rights reserved.
//

import UIKit

class JobifyPage: UIViewController {
    
    @IBOutlet weak var jobImage: UIImageView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupClearNavigationBarWithTitle()
        
        loginButton.layer.shadowOpacity = 1
        loginButton.layer.shadowOffset = CGSize(width: 4, height: 2)
        loginButton.layer.shadowRadius = 3
        loginButton.layer.shadowColor = UIColor.darkGray.cgColor
        loginButton.layer.masksToBounds = false
        
        createAccountButton.layer.shadowOpacity = 1
        createAccountButton.layer.shadowOffset = CGSize(width: 4, height: 2)
        createAccountButton.layer.shadowRadius = 3
        createAccountButton.layer.shadowColor = UIColor.darkGray.cgColor
        createAccountButton.layer.masksToBounds = false
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2, delay: 1, options: [], animations: {
                        self.jobImage.alpha = 1.0

        })
    }

}


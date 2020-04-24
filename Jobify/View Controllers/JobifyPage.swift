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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupClearNavigationBarWithTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 2, delay: 1, options: [], animations: {
                        self.jobImage.alpha = 1.0

        })
    }

}

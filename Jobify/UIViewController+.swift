//
//  UIViewController+.swift
//  DuIt
//
//  Created by Giovanni  Raininger  on 03/12/2019.
//  Copyright © 2019 Giovanni  Raininger . All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupClearNavigationBarWithTitle() {
        let navController = self.navigationController
        navController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    }
}

//
//  SplashScreen.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 27/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit

class SplashScreen: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Animates logo image from top of page to center with 'bounce' animation
        UIView.animate(withDuration: 0.8, delay: 0.25, options: .beginFromCurrentState, animations: {
               self.logoImageView.center.y = self.view.bounds.height  / 2
               }, completion: { (completion: Bool) in
                    UIView.animate(withDuration: 0.30, delay: 0.0, options: .beginFromCurrentState, animations: {
                        self.logoImageView.center.y = self.view.bounds.height / 2
                        }, completion: { (value: Bool) in
                            // Wait 1 second after animations complete before presenting the next ViewController
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                self.performSegue(withIdentifier: "splashComplete", sender: self)
                            }
                    })
        })
    }
}



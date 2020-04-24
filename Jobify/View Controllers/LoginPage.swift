//
//  LoginPage.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 24/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit
import Firebase


class LoginPage: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginButtonPressed(_ sender: Any) {
        
        guard let email = emailTextField.text else {
            // You should check the email is correctly formatted with @ signs etc
            // Use a UIAlert for this.
                
            return
        }
        guard let password = passwordTextField.text else {
            // You should check the password is correctly validated here e.g the password should contain a capital letter or should be longer than 8 characters
            // Use a UIAlert for this.
            
            return
        }
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          
            if let user = authResult?.user {
            self?.performSegue(withIdentifier: "successSignin", sender: nil)
              // successfully sign up
              
              // Here is how you can get the user id...
              let userId = user.uid
              // it should be used to be the primary key in storing data in firebase database
          
          } else {
            
            
            
            }
            
        }
    }
}


        
        

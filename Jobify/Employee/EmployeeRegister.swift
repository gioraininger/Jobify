//
//  EmployeeRegister.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 24/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit
import Firebase

class EmployeeRegister: UIViewController {
    

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
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
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                self.performSegue(withIdentifier: "successEmployeeSignup", sender: nil)
                // successfully sign up
                
                // Here is how you can get the user id...
                let userId = user.uid
                // it should be used to be the primary key in storing data in firebase database
            
            } else {
                // Unsuccessful sign up
                // You should create a UIAlert to tell the user sign up was unsuccessful here
                
            }
        }
        
    }
}

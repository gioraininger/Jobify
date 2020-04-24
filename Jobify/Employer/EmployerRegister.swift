//
//  EmployerRegister.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 23/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit
import Firebase

class EmployerRegister: UIViewController {
    
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        registerButton.layer.cornerRadius = 10
        registerButton.clipsToBounds = true
    }
    
 
    func displayMyAlertMessage(userMessage:String){

        let myAlert = UIAlertController(title: "Error", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Edit", style: UIAlertAction.Style.default, handler: nil)
       myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        
        
        guard let email = emailTextView.text, !email.isEmpty else {
            displayMyAlertMessage (userMessage: "Your email field is empty")
            return
        }
        
        
        guard let password = passwordTextView.text, !password.isEmpty else {
            // You should check the password is correctly validated here e.g the password should contain a capital letter or should be longer than 8 characters
            // Use a UIAlert for this.
            displayMyAlertMessage (userMessage: "Your password field is empty")

            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                self.performSegue(withIdentifier: "successEmployerSignup", sender: nil)
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

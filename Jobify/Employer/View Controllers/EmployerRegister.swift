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
    @IBOutlet weak var businessNameTextView: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        
        registerButton.layer.cornerRadius = 10
        registerButton.clipsToBounds = true
        hideKeyboardWhenTappedAround()
        
        registerButton.layer.shadowOpacity = 1
        registerButton.layer.shadowOffset = CGSize(width: 4, height: 2)
        registerButton.layer.shadowRadius = 3
        registerButton.layer.shadowColor = UIColor.darkGray.cgColor
        registerButton.layer.masksToBounds = false
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
        
        guard let businessName = businessNameTextView.text, !businessName.isEmpty else {
            // You should check the password is correctly validated here e.g the password should contain a capital letter or should be longer than 8 characters
            // Use a UIAlert for this.
            displayMyAlertMessage (userMessage: "Your name field is empty")

            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
               self.performSegue(withIdentifier: "successEmployerSignup", sender: nil)
                // successfully sign up
                
                // Here is how you can get the user id...
                let userId = user.uid
                AppSettings.saveUid(userId: userId)
                
                // it should be used to be the primary key in storing data in firebase database
//            var ref: DatabaseReference!

                let ref = Database.database().reference(fromURL:"https://jobify-ec052.firebaseio.com/")
                let usersReference = ref.child("users").child(userId)
                let values: [String : Any] = ["names": businessName, "email": email, "isEmployer": true ]
                
                usersReference.updateChildValues(values)
               // ref.child("users").setValue(values)
                                 
                
            } else {
                // Unsuccessful sign up
                // You should create a UIAlert to tell the user sign up was unsuccessful here
                print ()
            }
        }
        
    }
}

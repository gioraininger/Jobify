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
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        registerButton.layer.cornerRadius = 10
        registerButton.clipsToBounds = true
        hideKeyboardWhenTappedAround()
    }
    
    func displayMyAlertMessage(userMessage:String){

         let myAlert = UIAlertController(title: "Error", message: userMessage, preferredStyle: UIAlertController.Style.alert)
         let okAction = UIAlertAction(title: "Edit", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
         self.present(myAlert, animated: true, completion: nil)
     }
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        
        guard let email = emailTextField.text, !email.isEmpty else  {
        // You should check the email is correctly formatted with @ signs etc
        // Use a UIAlert for this.
         displayMyAlertMessage (userMessage: "Your email field is empty")
        return
    }
    
        guard let password = passwordTextField.text, !password.isEmpty else {
            // You should check the password is correctly validated here e.g the password should contain a capital letter or should be longer than 8 characters
            // Use a UIAlert for this.
            displayMyAlertMessage (userMessage: "Your password field is empty")
            return
        }
        
        guard let firstName = firstNameTextField.text, !firstName.isEmpty else {
            displayMyAlertMessage (userMessage: "Your name field is empty")

            return
        }

        guard let lastName = lastNameTextField.text, !lastName.isEmpty else {
            displayMyAlertMessage (userMessage: "Your name field is empty")
            return
        }
         
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                self.performSegue(withIdentifier: "successEmployeeSignup", sender: nil)
                // successfully sign up
                
                // Here is how you can get the user id...
                let userId = user.uid
                let ref = Database.database().reference(fromURL:"https://jobify-ec052.firebaseio.com/")
                let usersReference = ref.child("users").child(userId)
                let values: [String: Any] = ["firstName": firstName, "lastName": lastName, "email": email, "isEmployer": false]
                
                usersReference.updateChildValues(values)
            
            } else {
                // Unsuccessful sign up
                // You should create a UIAlert to tell the user sign up was unsuccessful here
                
            }
        }
        
    }
}

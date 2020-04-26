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
    
    func displayMyAlertMessage(userMessage:String){

        let myAlert = UIAlertController(title: "Error", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Edit", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
           
    

    @IBAction func LoginButtonPressed(_ sender: Any) {
        

               
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
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          
            if let user = authResult?.user {
                  // successfully sign in
                  
                  // Here is how you can get the user id...
                  let userId = user.uid
                self?.assignUserRole(userId: userId)
                  // it should be used to be the primary key in storing data in firebase database
                var ref: DatabaseReference!
                
                Database.database().reference().child("users").child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
                    //print(snapshot)
                    
                
                    
                    if let dictionary = snapshot.value as? [ String: AnyObject] {
//                        self.navigationItem.title = dictionary["names"] as? String
                        
                        if let name = dictionary["names"] as? String {
                            AppSettings.setName(nameToSave: name)
                        }
                        
                        if let firstName = dictionary ["firstName"] as? String {
                            AppSettings.setFirstName(firstNameToSave: firstName)
                        }
                    }
                }, withCancel: nil)
               // if let dictionary = snapshot.value as? [String: AnyObject] {
                    
                //}
             } else {
                let alert = UIAlertController(title: "Incorrect email or password", message: "Please try again.", preferredStyle: .alert)

                //alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))

                self!.present(alert, animated: true)
                
            }
            
        }
    }
    
    func assignUserRole(userId: String) {

       let thisUserRef = Database.database().reference().child("users").child(userId)
       thisUserRef.observeSingleEvent(of: .value, with: { snapshot in
        
            let dictionary = snapshot.value as? [String: Any]
            if let role = dictionary?["isEmployer"] as? Bool {
                print(role)
                
                if role {
                    // employer
                    self.performSegue(withIdentifier: "employerSegue", sender: nil)
                }
                self.performSegue(withIdentifier: "employeeSegue", sender: nil)
            }
       })
    }
    
}




        
        

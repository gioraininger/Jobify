//
//  EmployerRegister.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 23/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class EmployerRegister: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var businessNameTextView: UITextField!
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        
        registerButton.layer.cornerRadius = 10
        registerButton.clipsToBounds = true
        hideKeyboardWhenTappedAround()
        
        registerButton.layer.shadowOpacity = 1
        registerButton.layer.shadowOffset = CGSize(width: 4, height: 2)
        registerButton.layer.shadowRadius = 3
        registerButton.layer.shadowColor = UIColor.darkGray.cgColor
        registerButton.layer.masksToBounds = false
        
        setupPhotoProfile()
    }
    
    func setupPhotoProfile(){
        photoProfile.layer.cornerRadius = 15
        photoProfile.clipsToBounds = true
        photoProfile.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        photoProfile.addGestureRecognizer(tapGesture)
    }
    
    @objc func presentPicker(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
 
    func displayMyAlertMessage(userMessage:String){

        let myAlert = UIAlertController(title: "Error", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Edit", style: UIAlertAction.Style.default, handler: nil)
       myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        guard let imageSelected = self.image else{
            print ("Profile photo is nil")
            return
        }
        
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
        }
        
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
                var values: [String : Any] = ["names": businessName, "email": email, "isEmployer": true, "profilePhotoUrl": ""]
                
                usersReference.updateChildValues(values)
                let storageRef = Storage.storage().reference(forURL: "gs://jobify-ec052.appspot.com")
                let storageProfileRef = storageRef.child("users").child(userId)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/png"
                storageProfileRef.putData(imageData, metadata: metadata, completion:
                    { (StorageMetaData, error) in
                        if error != nil {
                            print(error!.localizedDescription)
                            return
                        }
                        
                        storageProfileRef.downloadURL(completion: {(url, error) in
                            if let metaImageUrl = url?.absoluteString {
                                values["profilePhotoUrl"] = metaImageUrl
                                usersReference.updateChildValues(values)
                            }
                        })
                        
                })
                                 
                
            } else {
                // Unsuccessful sign up
                // You should create a UIAlert to tell the user sign up was unsuccessful here
                print ()
            }
        }
        
    }
}
extension EmployerRegister {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info [UIImagePickerController.InfoKey.editedImage] as?
            UIImage {
            image = imageSelected
            photoProfile.image = imageSelected
        }
        if let imageOriginal = info [UIImagePickerController.InfoKey.editedImage] as?
            UIImage {
            image = imageOriginal
            photoProfile.image = imageOriginal
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  SnapchatClone
//
//  Created by MacxbookPro on 18.03.2020.
//  Copyright © 2020 MacxbookPro. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var usernameText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signInButton(_ sender: Any) {
        if passwordText.text != "" && emailText.text != "" {
            Auth.auth().signIn(withEmail: self.emailText.text!, password: self.passwordText.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "error", message: error?.localizedDescription ?? "error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
            
        }else{
            self.makeAlert(title: "Error", message: "sign in error")
        }
        
    }
    

    @IBAction func signUpButton(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" && emailText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "error", message: error?.localizedDescription ?? "error")
                }else{
                    
                    let fireStore = Firestore.firestore()
                    
                    let userDictionary = ["email":self.emailText.text!,"username":self.usernameText.text!,"userID":Auth.auth().currentUser?.uid] as! [String : Any]
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error) in
                        if error != nil {
                            self.makeAlert(title: "error", message: error?.localizedDescription ?? "error")
                        }
                    }
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
            }
        }else{
            self.makeAlert(title: "Error", message: "Username/Password/Email ?")
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true ,completion: nil)
    }
    
}


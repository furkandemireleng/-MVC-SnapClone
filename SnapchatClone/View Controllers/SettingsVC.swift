//
//  SettingsVC.swift
//  SnapchatClone
//
//  Created by MacxbookPro on 18.03.2020.
//  Copyright © 2020 MacxbookPro. All rights reserved.
//

import UIKit
import Firebase
class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutButtonClicked(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        }catch{
            
        }
    }
    

}

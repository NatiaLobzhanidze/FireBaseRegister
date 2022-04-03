//
//  SingUpViewController.swift
//  FireBaseRegister
//
//  Created by Natia's Mac on 31/03/2022.
//

import UIKit
import Firebase

class SingUpViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var repeatPassword: UITextField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createAccount(_ sender: Any) {
        
        let signUpManager = FireBaseAuthManager()
        if let email = userEmail.text, let password = userPassword.text {
            signUpManager.createUser(email: email, password: password){[weak self] (success) in
                guard let `self` = self else { return }
                var message: String = ""
                
                if success {
                    message = "User was sucessfully created"
                } else {
                    message = "There was an error"
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: true)
              
            }
        }
    }
    

}

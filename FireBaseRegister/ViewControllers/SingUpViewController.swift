//
//  SingUpViewController.swift
//  FireBaseRegister
//
//  Created by Natia's Mac on 31/03/2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SingUpViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var repeatPassword: UITextField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func validateFields() -> String? {
        if userName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            userEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            userPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
          
                return "Please fill in all line "
           
        }
        
         
        if userPassword.text != repeatPassword.text {
            
            return "passwords do not match"
        }
        
        return nil
    }
    
    @IBAction func createAccount(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            showEror(error!)
        } else {
            let usersName = userName.text!.trimmingCharacters(in: .whitespacesAndNewlines )
            let mail = userEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = userPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //
            
            Auth.auth().createUser(withEmail: mail, password: password){(result, err) in
                if err != nil {
                    print(err)
                    self.showEror("Error creating user")
                
                }else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "userName": usersName,
                       
                        "uid": result!.user.uid
                    ]) { error in
                        if error != nil {
                            self.showEror("error saving user data")
                        }
                    }
                    self.goToHomePage()
                }
            }
        }
       
              
    }
        
    func showEror(_ message: String){
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true)
    }
    
    
    func goToHomePage(){
        dismiss(animated: true, completion: nil)
        let ac = HomeViewController()
        self.present(ac, animated: true, completion: nil)
    }

}

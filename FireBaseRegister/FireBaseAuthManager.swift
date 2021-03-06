//
//  FireBaseAuthManager.swift
//  FireBaseRegister
//
//  Created by Natia's Mac on 31/03/2022.
//

import Foundation
import FirebaseAuth

class FireBaseAuthManager {
    
    func createUser(email: String, password: String, completionBlock: @escaping(_ success: Bool)-> Void){
        Auth.auth().createUser(withEmail: email, password: password){(authResult, error) in
            if let user = authResult?.user{
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
        
    }
}

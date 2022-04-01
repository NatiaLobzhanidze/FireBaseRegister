//
//  ViewController.swift
//  FireBaseRegister
//
//  Created by Natia's Mac on 21/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var singUpBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        singUpBtn.layer.borderWidth = 1
        singUpBtn.layer.borderColor = UIColor.black.cgColor
        singUpBtn.layer.cornerRadius = 5
        
        logInBtn.layer.borderWidth = 1
        logInBtn.layer.borderColor = UIColor.black.cgColor
        logInBtn.layer.cornerRadius = 5
        
        
       
    }


}


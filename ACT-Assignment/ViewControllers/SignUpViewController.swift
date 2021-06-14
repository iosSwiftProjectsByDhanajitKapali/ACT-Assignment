//
//  SignUpViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 14/06/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var nameView: UIView!
    @IBOutlet var mobileNumberView: UIView!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var mobileTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //managing design of UI elements
        backgroundView.layer.cornerRadius = 20.0
        nameView.layer.cornerRadius = 20.0
        mobileNumberView.layer.cornerRadius = 20.0
        emailView.layer.cornerRadius = 20.0
        passwordView.layer.cornerRadius = 20.0
        signupButton.layer.cornerRadius = 20.0
        
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
}

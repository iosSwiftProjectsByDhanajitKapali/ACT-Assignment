//
//  SignUpViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 14/06/21.
//
import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak private var backgroundView: UIView!
    @IBOutlet weak private var nameView: UIView!
    @IBOutlet weak private var mobileNumberView: UIView!
    @IBOutlet weak private var emailView: UIView!
    @IBOutlet weak private var passwordView: UIView!
    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var mobileTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //managing design of UI elements
        backgroundView.layer.cornerRadius = 20.0
        nameView.layer.cornerRadius = 20.0
        mobileNumberView.layer.cornerRadius = 20.0
        emailView.layer.cornerRadius = 20.0
        passwordView.layer.cornerRadius = 20.0
        signupButton.layer.cornerRadius = 20.0
        
        //to hide keyboard
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        if let name = nameTextField.text, !name.isEmpty, let mobileNo = mobileTextField.text, !mobileNo.isEmpty, let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty {
        
    
        }else{
            nameTextField.placeholder = K.TextMessage.EMPTY_NAME_MESSAGE
            mobileTextField.placeholder = K.TextMessage.EMPTY_MOBILE_NO_MESSAGE
            emailTextField.placeholder = K.TextMessage.EMPTY_EMAIL_MESSAGE
            passwordTextField.placeholder = K.TextMessage.EMPTY_PASSWORD_MESSAGE
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        //jump back to Login scene
        navigationController?.popViewController(animated: true)
    }
    
}

//
//  ViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 14/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak private var backgroundView: UIView!
    @IBOutlet weak private var emailView: UIView!
    @IBOutlet weak private var passwordView: UIView!
    @IBOutlet weak private var eyeButton: UIButton!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var loginButton: UIButton!
    
    private var eyeImage = EyeImageStatus.closedEye
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //managing the design of elements
        backgroundView.layer.cornerRadius = 20.0
        emailView.layer.cornerRadius = 20.0
        passwordView.layer.cornerRadius = 20.0
        loginButton.layer.cornerRadius = 20.0
        
        //to hide keyboard
        self.hideKeyboardWhenTappedAround()
        
        //setting delegates of textFields
        emailTextField.delegate = self
        passwordTextField.delegate = self
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        if(eyeImage == .closedEye){
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(K.Image.CLOSED_EYE_IMAGE , for: .normal)
            eyeImage = .openedEye
        }else{
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(K.Image.OPEN_EYE_IMAGE , for: .normal)
            eyeImage = .closedEye
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty{
            //jump to profile scene
            guard let destinationVC = storyboard?.instantiateViewController(identifier: K.SceneID.PROFILE_HOME_NOTIFICATION_TAB_BAR ) else {
                return
            }
            navigationController?.pushViewController(destinationVC, animated: true)
        }else{
            emailTextField.placeholder = K.TextMessage.EMPTY_EMAIL_MESSAGE
            passwordTextField.placeholder = K.TextMessage.EMPTY_PASSWORD_MESSAGE
        }
    }
}

//MARK: - UITextFieldDelegate Methods
extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // dismiss keyboard
            return true
    }
}

//MARK: - Hide Keyboard When Tapped Around
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

enum EyeImageStatus {
    case openedEye
    case closedEye
}






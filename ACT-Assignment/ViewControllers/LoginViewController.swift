//
//  ViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 14/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var eyeButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var eyeFlipper = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //managing the design of elements
        backgroundView.layer.cornerRadius = 20.0
        emailView.layer.cornerRadius = 20.0
        passwordView.layer.cornerRadius = 20.0
        loginButton.layer.cornerRadius = 20.0
        
        //adding gradint colors
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemPink.cgColor , UIColor.systemRed.cgColor ]
        gradientLayer.frame = backgroundView.frame
        //backgroundView.layer.addSublayer(gradientLayer)
        
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
    
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        if(eyeFlipper == 0){
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(named: "closedEye"), for: .normal)
            eyeFlipper = 1
        }else{
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(named: "openEye"), for: .normal)
            eyeFlipper = 0
        }
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty{
            //jump to profile scene
            guard let destinationVC = storyboard?.instantiateViewController(identifier: K.SceneID.profileHomeNotificationTabBar ) else {
                return
            }
            navigationController?.pushViewController(destinationVC, animated: true)
        }else{
            emailTextField.placeholder = "Email can't be empty"
            passwordTextField.placeholder = "Password can't be empty"
            print("empty entries for email and password")
        }
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




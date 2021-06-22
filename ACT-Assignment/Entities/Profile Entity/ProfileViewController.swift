//
//  ProfileViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 15/06/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var presenter : ProfilePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        presenter = ProfilePresenter(withDelegate: self)
        
        //hiding the activityIndicator
        activityIndicator.isHidden = true
    }
    
    @IBAction func postButtonPressed(_ sender: UIButton) {
        let title  = "testTitle"
        let body = "testBody"
        let id = 999
        showLoader()
        presenter.makePostApiCall(title: title, body: body, id: id)
    }

    @IBAction func getButtonPressed(_ sender: UIButton) {
        //presenter.makeGetApiCall()
        presenter.getVaccineAppointmentFor(pincode: "110017", withDate: "23-06-2021")
        showLoader()
    }
    
    private func showLoader(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    private func hideLoader(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
}

extension ProfileViewController : ProfilePresenterDelegate{
    func stopAndHideLoader() {
        hideLoader()
    }
    
    func presentAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
}



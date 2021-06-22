//
//  ProfileViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 15/06/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var presenter : ProfilePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        presenter = ProfilePresenter(withDelegate: self)
    }
    
    @IBAction func postButtonPressed(_ sender: UIButton) {
        let title  = "testTitle"
        let body = "testBody"
        let id = 999
        presenter.makePostApiCall(title: title, body: body, id: id)
    }

    @IBAction func getButtonPressed(_ sender: UIButton) {
        presenter.makeGetApiCall()
    }
}

extension ProfileViewController : ProfilePresenterDelegate{
    
}



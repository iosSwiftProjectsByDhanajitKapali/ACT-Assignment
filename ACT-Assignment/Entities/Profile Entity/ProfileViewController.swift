//
//  ProfileViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 15/06/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let menuButton = UIBarButtonItem(image: UIImage(systemName:"list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
        navigationItem.leftBarButtonItem  = menuButton
        
        
        print("welcome to Profle View")
    }
    
    @objc func didTapMenuButton() {
          print("Menu Button")
        
        //loading the XIB into our view
//        let view = SideMenu(frame: self.view.bounds)
//        self.view.addSubview(view)
      }
    

}

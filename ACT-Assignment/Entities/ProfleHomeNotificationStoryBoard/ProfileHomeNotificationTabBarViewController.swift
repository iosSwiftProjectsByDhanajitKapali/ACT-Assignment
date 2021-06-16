//
//  ProfileHomeNotificationTabBarViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 16/06/21.
//

import UIKit

class ProfileHomeNotificationTabBarViewController: UITabBarController {

    private var menuFlipper = MenuStatus.isClosed
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //changing the navigation bar back button with menu image, clicking it XIB for Menu will appear
        let menuButton = UIBarButtonItem(image: K.Image.SystemImage.LIST_DASH , style: .done, target: self, action: #selector(didTapMenuButton))
        navigationItem.leftBarButtonItem  = menuButton
    }
    
    enum MenuStatus{
        case isOpened
        case isClosed
    }
    
    @objc func didTapMenuButton() {
        if(menuFlipper == .isClosed){
            //loading the XIB into our view
            let view = SideMenu(frame: self.view.bounds)
            view.tag = 1
            self.view.addSubview(view)
            view.delegate = self
            menuFlipper = .isOpened
        }else{
            if let viewWithTag = self.view.viewWithTag(1){
                viewWithTag.removeFromSuperview()
                menuFlipper = .isClosed
            }
            
        }
       
    } //:didTapMenuButton

}

//MARK: - SideMenu Delegates
extension ProfileHomeNotificationTabBarViewController : SideMenuDelegate {
    func dismissMenuWithTouch() {
        if let viewWithTag = self.view.viewWithTag(1){
            viewWithTag.removeFromSuperview()
            menuFlipper = .isClosed
        }
    }
    
    func menuButtonPressed(_ ofTitle: String?) {
        if let buttonTitle = ofTitle{
            print(buttonTitle)
        }
    }
    
    func LogoutButtonPress() {
        //pop to login scene
        navigationController?.popViewController(animated: true)
    }
}

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
        
        
//
//        let ProfileVC = ProfileViewController()
//        let HomeVC = HomeViewController()
//        let NotificationVC = NotificationsViewController()
//
//
//        ProfileVC.tabBarItem = UITabBarItem.init(title: "Profile" , image: K.Image.AssetImage.PROFILE_ICON, tag: 1)
//        HomeVC.tabBarItem = UITabBarItem.init(title: "Profile" , image: K.Image.AssetImage.HOME_ICON, tag: 2)
//        NotificationVC.tabBarItem = UITabBarItem.init(title: "Notification", image: K.Image.AssetImage.NOTIFICATION_ICON, tag: 3)
//
//        print("done adding icons")
    }
    
    enum MenuStatus{
        case isOpened
        case isClosed
    }
    
    //Opening the Menu and closing it, if it is already open
    @objc func didTapMenuButton() {
        if(menuFlipper == .isClosed){
            showMenu()
        }else{
            hideMenu()
        }
       
    } //:didTapMenuButton
    
    func hideMenu(){
        if let viewWithTag = self.view.viewWithTag(1){
            viewWithTag.removeFromSuperview()
            menuFlipper = .isClosed
        }
    }
    
    func showMenu(){
        //loading the XIB into our view
        let view = SideMenu(frame: self.view.bounds)
        view.tag = 1
        self.view.addSubview(view)
        view.delegate = self
        menuFlipper = .isOpened
    }

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
            
            //if Button pressed in Menu is Logout Button
            if buttonTitle == K.Title.ButtonTitle.LOGOUT_BUTTON{
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
}

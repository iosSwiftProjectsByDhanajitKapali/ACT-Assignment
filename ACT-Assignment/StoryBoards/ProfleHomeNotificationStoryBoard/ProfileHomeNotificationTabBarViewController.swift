//
//  ProfileHomeNotificationTabBarViewController.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 16/06/21.
//

import UIKit

protocol ProfileHomeNotificationTabBarViewControllerDelegate{
    func animateHideMenuOnMenuButtonClick()
}

enum MenuStatus{
    case isOpened
    case isClosed
}

class ProfileHomeNotificationTabBarViewController: UITabBarController {

    private var menuFlipper = MenuStatus.isClosed
    static var profileHomeNotificationTabBarViewControllerDelegate : ProfileHomeNotificationTabBarViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //changing the navigation bar back button with menu image, clicking it XIB for Menu will appear
        let menuButton = UIBarButtonItem(image: K.Image.SystemImage.LIST_DASH , style: .done, target: self, action: #selector(didTapMenuButton))
        navigationItem.leftBarButtonItem  = menuButton
        
        setTabBarItemImage()
    }
    
    func setTabBarItemImage(){
        let tabBarVCArr = self.viewControllers
        if let tabBarVCs = tabBarVCArr{
            
            let ProfileVC = tabBarVCs[0]
            let HomeVC = tabBarVCs[1]
            let NotificationVC = tabBarVCs[2]
            
            ProfileVC.tabBarItem = UITabBarItem.init(title: K.Title.TabBarItem.PRFOFILE_TITLE , image: K.Image.AssetImage.PROFILE_ICON, tag: 1)
            HomeVC.tabBarItem = UITabBarItem.init(title: K.Title.TabBarItem.HOME_TITLE , image: K.Image.AssetImage.HOME_ICON, tag: 2)
            NotificationVC.tabBarItem = UITabBarItem.init(title: K.Title.TabBarItem.NOTIFICATION_TITLE , image: K.Image.AssetImage.NOTIFICATION_ICON, tag: 3)
        }
    }
    
    
    //Opening the Menu and closing it, if it is already open
    @objc func didTapMenuButton() {
        if(menuFlipper == .isClosed){
            showMenu()
        }else{
            ProfileHomeNotificationTabBarViewController.profileHomeNotificationTabBarViewControllerDelegate?.animateHideMenuOnMenuButtonClick()
            //hideMenu()
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
            
            if buttonTitle == K.Title.ButtonTitle.HOME {
                self.selectedIndex = 1
            }
        }
    }
    
}

//
//  Constants.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 14/06/21.
//

import Foundation
import UIKit

struct K {
    struct StoryBoardID {
        static let PROFILE_HOME_NOTIFICATION = "ProfileHomeNotification"
        static let MAIN = "Main"
    }
    struct SceneID {
        static let SIGNUP_SCENE = "signupScene"
        static let LOGIN_SCENE = "loginScene"
        static let PROFILE_HOME_NOTIFICATION_TAB_BAR = "profileHomeNotificationTabBarScene"
        static let HOME_SCENE = "homeScene"
        static let PROFILE_SCENE = "profileScene"
        static let NOTIFICATION_SCENE = "notificationsScene"
    }
    
    struct XibWithName {
        static let SIDE_MENU = "SideMenu"
        static let MENU_BUTTON_CELL = "MenuButtonCell"
    }
    
    struct TableViewCellID {
        static let MENU_BUTTON_CELL_ID = "menuButtonCellID"
    }
    
    struct Image {
        struct AssetImage{
            static let MALE_USER =  UIImage(named: "male-user")
            static let CLOSED_EYE_IMAGE = UIImage(named: "closedEye")
            static let OPEN_EYE_IMAGE = UIImage(named: "openEye")
            static let PROFILE_ICON = UIImage(named: "profile-icon")
            static let HOME_ICON = UIImage(named: "home-icon")
            static let NOTIFICATION_ICON = UIImage(named: "notification-icon")
        }
       
        struct SystemImage {
            static let LIST_DASH = UIImage(systemName:"list.dash")
        }
    }
    
    struct Title {
        struct ButtonTitle {
            static let LOGOUT_BUTTON = "Logout"
        }
    }
    
    struct TextMessage {
        static let EMPTY_EMAIL_MESSAGE = "Email can't be empty"
        static let EMPTY_PASSWORD_MESSAGE = "Password can't be empty"
        static let EMPTY_MOBILE_NO_MESSAGE = "Mobile No. can't be empty"
        static let EMPTY_NAME_MESSAGE = "Name can't be empty"
    }
    
   
}

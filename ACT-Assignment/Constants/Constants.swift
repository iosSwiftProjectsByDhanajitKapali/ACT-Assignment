//
//  Constants.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 14/06/21.
//

import Foundation
import UIKit

struct K {
    struct SceneID {
        static let SIGNUP_SCENE = "signupScene"
        static let PROFILE_HOME_NOTIFICATION_TAB_BAR = "profileHomeNotificationTabBarScene"
        static let HOME_SCENE = "homeScene"
        static let PROFILE_SCENE = "profileScene"
        static let NOTIFICATION_SCENE = "notificationsScene"
    }
    
    struct Image {
        static let CLOSED_EYE_IMAGE = UIImage(named: "closedEye")
        static let OPEN_EYE_IMAGE = UIImage(named: "openEye")
    }
    
    struct TextMessage {
        static let EMPTY_EMAIL_MESSAGE = "Email can't be empty"
        static let EMPTY_PASSWORD_MESSAGE = "Password can't be empty"
        static let EMPTY_MOBILE_NO_MESSAGE = "Mobile No. can't be empty"
        static let EMPTY_NAME_MESSAGE = "Name can't be empty"
    }
    
   
}

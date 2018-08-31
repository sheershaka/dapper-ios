//
//  Constants.swift
//  Dapper
//
//  Created by Zach Dingels on 8/6/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit
import AWSCore

struct CONST {
    
    struct AWS {
        
        static let REGION: AWSRegionType = AWSRegionType.USWest2
        
        struct COGNITO {
            static let CLIENT_ID: String = "3c0dfjnn1qf4qqbfhpnagb1vg9"
            static let CLIENT_SECRET: String = "c44spajct5rbdvgft5kpttca2pp0gaq6i3msctnlemmcql3g4s0"
            static let POOL_ID: String = "us-west-2_96PLwtoLp"
            static let POOL_NAME: String = "dapper-clients"
            static let IDENTITY_POOL_ID: String = "us-west-2:a75f5eb3-d959-4a54-802c-10b2cba37fa4"
        }
    }
    
    struct UI {
        static let BACKGROUND_COLOR: UIColor = UIColor(red: 88/255, green: 145/255, blue: 129/255, alpha: 1)
        
        struct TITLE_IMG {
            static let SIDE_MARGIN: CGFloat = 0.2
        }
        
        struct FRAME {
            static let SIDE_MARGIN: CGFloat = 0.13
            static let BOTTOM_MARGIN: CGFloat = 0.06
        }
        
        struct BUTTON {
            static let COLOR: UIColor = UIColor(red: 22/255, green: 66/255, blue: 53/255, alpha: 1)
            static let PRESSED_COLOR: UIColor = UIColor(red: 153/255, green: 204/255, blue: 188/255, alpha: 1)
            static let BORDER_COLOR: UIColor = UIColor(red: 136/255, green: 194/255, blue: 177/255, alpha: 1)
            static let FONT_COLOR: UIColor = UIColor.white
            static let FONT: UIFont = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 24)!
            
            static let HEIGHT: CGFloat = 50
            static let CORNER_RADIUS: CGFloat = 20
            static let BORDER_THICCC: CGFloat = 2
        }
        
        struct TEXT_FIELD {
            static let COLOR: UIColor = UIColor(red: 153/255, green: 204/255, blue: 188/255, alpha: 0.8)
            static let PLACEHOLDER_COLOR: UIColor = UIColor.white
            
            static let FONT_COLOR: UIColor = UIColor.white
            static let FONT: UIFont = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 24)!
            
            
            static let CORNER_RADIUS: CGFloat = 15
            static let BORDER_THICCC: CGFloat = 2
            static let BORDER_COLOR: UIColor = UIColor.white
            
            static let TOP_MARGIN: CGFloat = 0.1
            static let TEXT_FIELD_MARGIN: CGFloat = 0.05
        }
        
        struct FONT {
            static let DEFAULT_FONT: UIFont = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 24)!
            static let DEFAULT_COLOR: UIColor = UIColor.white
        }
        
        struct TEXT {
            static let LANDING_SCREEN_PHONE_MESSAGE: String = "Enter your phone number..."
            static let CONFIRMATION_SCREEN_MESSAGE: String = "Enter your confirmation code..."
        }
    }
}

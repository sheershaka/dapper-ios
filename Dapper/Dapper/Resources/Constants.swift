//
//  Constants.swift
//  Dapper
//
//  Created by Zach Dingels on 8/6/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import AWSCore

struct CONST {
    
    struct AWS {
        
        static let REGION: AWSRegionType = AWSRegionType.USWest2
        
        struct COGNITO {
            static let CLIENT_ID = "3c0dfjnn1qf4qqbfhpnagb1vg9"
            static let CLIENT_SECRET = "c44spajct5rbdvgft5kpttca2pp0gaq6i3msctnlemmcql3g4s0"
            static let POOL_ID = "us-west-2_96PLwtoLp"
            static let POOL_NAME = "dapper-clients"
        }
    }
}

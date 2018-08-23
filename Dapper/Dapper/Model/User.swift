//
//  User.swift
//  Dapper
//
//  Created by Zach Dingels on 8/19/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation


class User: NSObject {
    let f_name: String?
    let l_name: String?
    let phone: String?
    let email: String?
    
    init(f_name: String, l_name: String, phone: String, email: String) {
        self.f_name = f_name
        self.l_name = l_name
        self.phone = phone
        self.email = email
    }
}

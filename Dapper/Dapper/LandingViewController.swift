//
//  ViewController.swift
//  Dapper
//
//  Created by Zach Dingels on 8/1/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import AWSCore
import AWSPinpoint
import UIKit
import AWSAuthCore
import AWSAuthUI
import AWSMobileClient

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Check if AWS SignInManager is connected
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            print("User signed in")
        } else {
            print("User not signed in")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//
//  SignUpViewController.swift
//  Dapper
//
//  Created by Zach Dingels on 8/9/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import AWSCore
import AWSPinpoint
import UIKit
import AWSAuthCore
import AWSAuthUI
import AWSMobileClient
import AWSCognitoIdentityProvider

class LogInViewController: UIViewController, AWSCognitoIdentityInteractiveAuthenticationDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AWS.shared.pool?.delegate = self
        
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        AWS.shared.currentUser?.getSession(usernameTextField.text!, password: passwordTextField.text!, validationData: nil) .continueWith(block:
            { (task: AWSTask) -> Any? in
                // If success...
                // Load a new screen
                // If failure
                // Pop up saying info is wrong
                
                // Need to run on the main thread... cool
                //DispatchQueue.main.async {}
                
                return nil
        })
        print(AWSSignInManager.sharedInstance().isLoggedIn)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

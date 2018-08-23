//
//  ViewController.swift
//  Dapper
//
//  Created by Zach Dingels on 8/1/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//
//  TODO: Programatically Create a layout that includes:
//          - Label: Enter your phone number
//          - Text Field: Phone NUmber
//          - Button: Continue with phone number
//          - Label : Or connect with a social profile
//          - FBButton: Facebook button to connect
//          - GOOGButon: Google button to connect
//
//        Actions:
//          - User clicks enter phone number
//              - If the phone number is registered ask for a password
//              - If it isn't take them to the login page
//          - User clicks facebook button
//              - If an account is associated with their number then login
//              - If an account isn't then create an account
//          - User clicks google button
//              - If an account is associated with their number then login
//              - If an account isn't then create an account

import AWSCore
import AWSPinpoint
import UIKit
import AWSCognitoIdentityProvider

class LandingViewController: UIViewController {
    var passwordAuthenticationCompletion: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        let background = BGLogoView(frame: CGRect.zero)
        print("2")
        self.view.addSubview(background)
        print("3")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension LandingViewController: AWSCognitoIdentityPasswordAuthentication {
    func getDetails(_ authenticationInput: AWSCognitoIdentityPasswordAuthenticationInput, passwordAuthenticationCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>) {
        print("called-getDetails")
        self.passwordAuthenticationCompletion = passwordAuthenticationCompletionSource
    }
    
    func didCompleteStepWithError(_ error: Error?) {
        // Gets called when a password is wrong.
        print("called-didCompleteStepWithError")
        DispatchQueue.main.async {
            if let error = error as? NSError {
                let alertController = UIAlertController(title: error.userInfo["__type"] as? String,
                                                        message: error.userInfo["message"] as? String,
                                                        preferredStyle: .alert)
                let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
                alertController.addAction(retryAction)
                
                self.present(alertController, animated: true, completion:  nil)
            }
        }
    }
}


//
//  DAPSignUpViewController.swift
//  Dapper
//
//  Created by Zach Dingels on 8/25/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit
import AWSCore
import AWSCognitoIdentityProvider

class DAPSignInViewController: DAPViewController {
    
    var DAPView: DAPSignInView?
    var passwordAuthenticationCompletion: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DAPView = DAPSignInView(frame: self.view.frame)
        
        DAPView?.forgotPasswordButton.addTarget(self, action: #selector(self.forgotPasswordPressed(_:)), for: UIControlEvents.touchUpInside)
        DAPView?.submitButton.addTarget(self, action: #selector(self.submitPressed(_:)), for: UIControlEvents.touchUpInside)
        DAPView?.cancelButton.addTarget(self, action: #selector(self.cancelPressed(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(DAPView!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func forgotPasswordPressed(_ sender: UITapGestureRecognizer) {
        let vc = DAPForgotPasswordViewController()
        present(vc, animated: true)
    }
    
    func submitPressed(_ sender: UITapGestureRecognizer) {
        let username = DAPView?.usernameTextField.text
        let password = DAPView?.passwordTextField.text
        
        let fieldsAreNonEmpty: Bool = username != "" && password != ""
        if (fieldsAreNonEmpty) {
            let authDetails = AWSCognitoIdentityPasswordAuthenticationDetails(username: username!, password: password!)
            self.passwordAuthenticationCompletion?.set(result: authDetails)
        } else {
            let alertController = UIAlertController(title: "Missing information",
                                                    message: "Please enter a valid user name and password",
                                                    preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
            alertController.addAction(retryAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func cancelPressed(_ sender: UITapGestureRecognizer) {
        let vc = DAPLandingViewController()
        present(vc, animated: true)
    }
}

extension DAPSignInViewController: AWSCognitoIdentityPasswordAuthentication {
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



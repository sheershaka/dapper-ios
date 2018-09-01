//
//  DAPSignUpViewController.swift
//  Dapper
//
//  Created by Zach Dingels on 8/25/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import AWSCore
import AWSPinpoint
import UIKit
import AWSAuthCore
import AWSAuthUI
import AWSMobileClient
import AWSCognitoIdentityProvider

class DAPSignUpViewController: DAPViewController {
    
    var DAPView: DAPSignUpView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DAPView = DAPSignUpView(frame: self.view.frame)
        
        DAPView?.submitButton.addTarget(self, action: #selector(self.submitPressed(_:)), for: UIControlEvents.touchUpInside)
        DAPView?.cancelButton.addTarget(self, action: #selector(self.cancelPressed(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(DAPView!)
        
        // TODO Remove this
        DAPView?.nameTextField.text = "/dingelsz"
        DAPView?.phoneTextField.text = "2062938432"
        DAPView?.emailTextField.text = "dingelsz@uw.edu"
        DAPView?.passwordTextField.text = "tester123"
        DAPView?.confirmPasswordTextField.text = "tester123"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func submitPressed(_ sender: UITapGestureRecognizer) {
        let username = DAPView?.nameTextField.text
        let phone = DAPView?.phoneTextField.text
        let email = DAPView?.emailTextField.text
        let password = DAPView?.passwordTextField.text
        let password2 = DAPView?.confirmPasswordTextField.text
        
        var errorMessage = ""
        
        // Check each field
        if username == "" {
            errorMessage = "Please enter a username."
        }
        
        let phoneRegEx = "^\\d{10}$"
        if phone == "" {
            errorMessage = "Please enter a phone number."
        } else if !NSPredicate(format: "SELF MATCHES %@", phoneRegEx).evaluate(with: phone) {
            errorMessage = "Please enter a valid 10 digit phone number."
        }
        
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        if email == "" {
            errorMessage = "Please enter an email."
        } else if !NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email) {
            errorMessage = "Please enter a valid email."
        }
        
        if password == "" {
            errorMessage = "Please enter a password."
        }
        
        if password2 == "" {
            errorMessage = "Please confirm your password."
        }
        
        if password != password2 {
            errorMessage = "Passwords do not match."
        }
        
        if errorMessage != "" {
            let alertController = UIAlertController(title: "Sign up errors",
                                                    message: errorMessage,
                                                    preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
            alertController.addAction(retryAction)
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        // let phoneAttribute = AWSCognitoIdentityUserAttributeType(name: "phone", value: phone!)
        let emailAttribute = AWSCognitoIdentityUserAttributeType(name: "email", value: email!)
        
        AWS.shared.pool?.signUp(username!, password: password!, userAttributes: [emailAttribute], validationData: nil).continueWith(block: { (task: AWSTask<AWSCognitoIdentityUserPoolSignUpResponse>) -> Any? in
            DispatchQueue.main.async {
                if let error = task.error {
                    let nserror = error as! NSError
                    let alertController = UIAlertController(title: nserror.userInfo["__type"] as? String,
                                                            message: nserror.userInfo["message"] as? String,
                                                            preferredStyle: .alert)
                    let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
                    alertController.addAction(retryAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                } else {
                    let response: AWSCognitoIdentityUserPoolSignUpResponse = task.result! as AWSCognitoIdentityUserPoolSignUpResponse
                    // NSLog("AWSCognitoIdentityUserPoolSignUpResponse: \(response)")
                    AWS.shared.currentUser = response.user
                    
                    let vc = DAPConfirmationViewController()
                    self.present(vc, animated: true)
                }
            }
            return nil
        })
        
    }
    
    @objc func cancelPressed(_ sender: UITapGestureRecognizer) {
        let vc = DAPLandingViewController()
        present(vc, animated: true)
    }
    
    
}


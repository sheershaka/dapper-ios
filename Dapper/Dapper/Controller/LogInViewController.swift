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
import FacebookLogin
import FacebookCore


class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var passwordAuthenticationCompletion: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>?
    
    override func viewDidLoad() {
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
        loginButton.delegate = self
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        
        super.viewDidLoad()
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        print("Hello")
        let fieldsAreNonEmpty: Bool = !(usernameTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)!
        if (fieldsAreNonEmpty) {
            let authDetails = AWSCognitoIdentityPasswordAuthenticationDetails(username: usernameTextField.text!, password: passwordTextField.text!)
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LogInViewController: AWSCognitoIdentityPasswordAuthentication {
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
    
extension LogInViewController: LoginButtonDelegate {
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
       print("done")
        AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider.credentials().continueWith(block: { (task) -> Any? in
                print(task.result ?? "nil")
                return task
        })
        
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("didn't log in")
    }
}

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

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let fieldsAreNonEmpty: Bool = !(phoneNumberTextField.text?.isEmpty)! && !(emailTextField.text?.isEmpty)! && !(nameTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! && !(confirmPasswordTextField.text?.isEmpty)!
        let passwordsAreTheSame: Bool = passwordTextField.text == confirmPasswordTextField.text
        
        if fieldsAreNonEmpty && passwordsAreTheSame {
            let emailAttributes = AWSCognitoIdentityUserAttributeType(name: "email", value: emailTextField.text!)
            AWS.shared.pool?.signUp(nameTextField.text!, password: passwordTextField.text!, userAttributes: [emailAttributes], validationData: nil).continueWith(block: { (task: AWSTask<AWSCognitoIdentityUserPoolSignUpResponse>) -> Any? in
                return task
            })
        } else {
            let alertController = UIAlertController(title: "Missing information",
                                                    message: "Please fill out all of the forms",
                                                    preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
            alertController.addAction(retryAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}

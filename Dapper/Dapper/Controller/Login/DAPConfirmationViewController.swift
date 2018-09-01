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

class DAPConfirmationViewController: DAPViewController {
    
    var DAPView: DAPConfirmationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DAPView = DAPConfirmationView(frame: self.view.frame)
        
        DAPView?.submitButton.addTarget(self, action: #selector(self.submitPressed(_:)), for: UIControlEvents.touchUpInside)
        DAPView?.cancelButton.addTarget(self, action: #selector(self.cancelPressed(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(DAPView!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func submitPressed(_ sender: UITapGestureRecognizer) {
        let confirmationCode = DAPView?.confirmTextField.text
        print(confirmationCode)
        AWS.shared.currentUser?.confirmSignUp(confirmationCode!).continueWith(block: { (task: AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse>) -> Any? in
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
                    // TODO present homescreen.
                    print("user confirmed")
                }
            }
        })
    }
    
    func cancelPressed(_ sender: UITapGestureRecognizer) {
        let vc = DAPLandingViewController()
        present(vc, animated: true)
    }
}


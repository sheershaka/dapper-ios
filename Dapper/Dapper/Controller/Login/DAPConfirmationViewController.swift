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
    
    override func viewDidAppear(_ animated: Bool) {
        DAPUtils.alert(title: "", message: "Please enter the confirmation code sent to your email.", buttonMessage: "Ok", viewController: self)
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
                    DAPUtils.alert(title: nserror.userInfo["__type"] as! String, message: nserror.userInfo["message"] as! String, buttonMessage: "Retry", viewController: self)
                    
                } else {
                    let vc = DAPScheduleAppointmentViewController()
                    self.present(vc, animated: true)
                }
            }
        })
    }
    
    func cancelPressed(_ sender: UITapGestureRecognizer) {
        let vc = DAPLandingViewController()
        present(vc, animated: true)
    }
}


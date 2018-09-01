//
//  ViewController.swift
//  Dapper
//
//  Created by Zach Dingels on 8/1/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.

import AWSCore
import AWSPinpoint
import UIKit
import AWSCognitoIdentityProvider

class DAPLandingViewController: DAPViewController {
    
    var DAPView: DAPLandingView?
    
    var passwordAuthenticationCompletion: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DAPView = DAPLandingView(frame: self.view.frame)
        
        DAPView?.signUpButton.addTarget(self, action: #selector(self.signUpPressed(_:)), for: UIControlEvents.touchUpInside)
        DAPView?.signInButton.addTarget(self, action: #selector(self.signInPressed(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(DAPView!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signUpPressed(_ sender: UITapGestureRecognizer) {
        let vc = DAPSignUpViewController()
        present(vc, animated: true)
    }
    
    func signInPressed(_ sender: UITapGestureRecognizer) {
        let vc = DAPSignInViewController()
        present(vc, animated: true)
    }
}

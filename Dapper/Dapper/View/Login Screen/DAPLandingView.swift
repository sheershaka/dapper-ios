//
//  BGLogoView.swift
//  Dapper
//
//  Created by Zach Dingels on 8/20/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit
import FacebookLogin
import GoogleSignIn

class DAPLandingView: _DAPLogoView {
    
    var signUpButton: DAPButton = DAPButton()
    var signInButton: DAPButton = DAPButton()
    var FBLoginButton: LoginButton = LoginButton(readPermissions: [ .publicProfile ])
    var googleLoginButton: GIDSignInButton = GIDSignInButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSignUpButton()
        setupSignInButton()
        setupFBButton()
        setupGoogleButton()
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
    }
    
    func setupSignUpButton() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = self.frame.height * 0.3
        
        signUpButton.frame = CGRect(x: x, y: y, width: width, height: height)
        
        signUpButton.setTitle("Sign Up", for: UIControlState.normal)
    }
    
    func setupSignInButton() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = self.signUpButton.frame.maxY + CONST.UI.FRAME.SIDE_MARGIN / 2 * frame.height + 2
        
        signInButton.frame = CGRect(x: x, y: y, width: width, height: height)
        
        signInButton.setTitle("Sign In", for: UIControlState.normal)
    }
    
    func setupFBButton() {
        let width: CGFloat = self.frame.width / 2 * (1 - 3 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = 42
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = self.signInButton.frame.maxY + CONST.UI.FRAME.SIDE_MARGIN / 2 * frame.height + 2
        FBLoginButton.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    func setupGoogleButton() {
        let width: CGFloat = self.frame.width / 2 * (1 - 3 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = 50 // Doesn't work
        let x: CGFloat = self.frame.width * 2 * CONST.UI.FRAME.SIDE_MARGIN + width
        let y: CGFloat = self.signInButton.frame.maxY + CONST.UI.FRAME.SIDE_MARGIN / 2 * frame.height
        googleLoginButton.frame = CGRect(x: x, y: y, width: width, height: height)
    }

    private func addViews() {
        addSubview(signUpButton)
        addSubview(signInButton)
        addSubview(FBLoginButton)
        addSubview(googleLoginButton)
    }
}

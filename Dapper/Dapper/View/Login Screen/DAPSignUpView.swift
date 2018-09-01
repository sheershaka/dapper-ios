//
//  BGLogoView.swift
//  Dapper
//
//  Created by Zach Dingels on 8/25/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//
// TODO - Create textfields that give a visual key that their values are wrong, e.g. red border when password isn't long enough

import Foundation
import UIKit

class DAPSignUpView: _DAPLogoView {
    
    var nameTextField: DAPTextField = DAPTextField()
    var phoneTextField: DAPTextField = DAPTextField()
    var emailTextField: DAPTextField = DAPTextField()
    var passwordTextField: DAPTextField = DAPTextField()
    var confirmPasswordTextField: DAPTextField = DAPTextField()
    var submitButton: DAPButton = DAPButton()
    var cancelButton: DAPButton = DAPButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNameTextField()
        setupPhoneTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupConfirmPasswordTextField()
        setupSubmitButton()
        setupCancelButton()
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
    }
    
    func setupNameTextField() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = self.frame.height * CONST.UI.TEXT_FIELD.TOP_MARGIN
        
        nameTextField.frame = CGRect(x: x, y: y, width: width, height: height)
        
        nameTextField.placeholder = "User Name"
        nameTextField.autocapitalizationType = UITextAutocapitalizationType.none
    }
    
    func setupPhoneTextField() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = nameTextField.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
        phoneTextField.frame = CGRect(x: x, y: y, width: width, height: height)
        
        phoneTextField.placeholder = "Phone Number"
        
        phoneTextField.keyboardType = UIKeyboardType.phonePad
    }
    
    func setupEmailTextField() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = phoneTextField.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
        emailTextField.frame = CGRect(x: x, y: y, width: width, height: height)
        
        emailTextField.placeholder = "Email"
        
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        nameTextField.autocapitalizationType = UITextAutocapitalizationType.none
    }
    
    func setupPasswordTextField() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = emailTextField.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
        passwordTextField.frame = CGRect(x: x, y: y, width: width, height: height)
        
        passwordTextField.placeholder = "Password"
        
        passwordTextField.isSecureTextEntry = true
    }
    
    func setupConfirmPasswordTextField() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = passwordTextField.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
        confirmPasswordTextField.frame = CGRect(x: x, y: y, width: width, height: height)
        
        confirmPasswordTextField.placeholder = "Confirm Password"
        
        confirmPasswordTextField.isSecureTextEntry = true
    }
    
    func setupSubmitButton() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = confirmPasswordTextField.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
        submitButton.frame = CGRect(x: x, y: y, width: width, height: height)
        
        submitButton.setTitle("Sign Up", for: UIControlState.normal)
    }
    
    func setupCancelButton() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = submitButton.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
        cancelButton.frame = CGRect(x: x, y: y, width: width, height: height)
        
        cancelButton.setTitle("Cancel", for: UIControlState.normal)
    }
    
    private func addViews() {
        addSubview(nameTextField)
        addSubview(phoneTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(submitButton)
        addSubview(cancelButton)
        addSubview(cancelButton)
    }
}

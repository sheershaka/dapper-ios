//
//  DAPForgotPasswordView.swift
//  Dapper
//
//  Created by Zach Dingels on 8/26/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit

class DAPForgotPasswordView: _DAPLogoView {
    
    var usernameTextField: DAPTextField = DAPTextField()
    var submitButton: DAPButton = DAPButton()
    var cancelButton: DAPButton = DAPButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUsernameTextField()
        setupSubmitButton()
        setupCancelButton()
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
    }
    
    func setupUsernameTextField() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = self.frame.height * CONST.UI.TEXT_FIELD.TOP_MARGIN
        
        usernameTextField.frame = CGRect(x: x, y: y, width: width, height: height)
        
        usernameTextField.placeholder = "User Name"
    }
    
    func setupSubmitButton() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = usernameTextField.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
        submitButton.frame = CGRect(x: x, y: y, width: width, height: height)
        
        submitButton.setTitle("Submit", for: UIControlState.normal)
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
        addSubview(usernameTextField)
        addSubview(submitButton)
        addSubview(cancelButton)
    }
}


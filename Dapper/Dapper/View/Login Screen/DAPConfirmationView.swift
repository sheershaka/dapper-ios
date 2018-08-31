//
//  BGLogoView.swift
//  Dapper
//
//  Created by Zach Dingels on 8/25/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit

class DAPConfirmationView: _DAPLogoView {
    
    var confirmTextField: DAPTextField = DAPTextField()
    var submitButton: DAPButton = DAPButton()
    var cancelButton: DAPButton = DAPButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfirmTextField()
        setupSubmitButton()
        setupCancelButton()
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
    }
    
    func setupConfirmTextField() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = self.frame.height * CONST.UI.TEXT_FIELD.TOP_MARGIN
        
        confirmTextField = DAPTextField(frame: CGRect(x: x, y: y, width: width, height: height))
        
        confirmTextField.keyboardType = UIKeyboardType.numberPad
        
        confirmTextField.placeholder = "Confirmation Code"
    }
    
    func setupSubmitButton() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = confirmTextField.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
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
        addSubview(confirmTextField)
        addSubview(submitButton)
        addSubview(cancelButton)
    }
}

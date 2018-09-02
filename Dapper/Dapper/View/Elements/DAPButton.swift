//
//  DAPButton.swift
//  Dapper
//
//  Created by Zach Dingels on 8/25/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit

class DAPButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Didn't ovveride aDecoder initializer")
    }
    
    private func setupView() {
        backgroundColor = CONST.UI.BUTTON.COLOR
        layer.borderColor = CONST.UI.BUTTON.BORDER_COLOR.cgColor
        layer.borderWidth = CONST.UI.BUTTON.BORDER_THICCC
        layer.cornerRadius = CONST.UI.BUTTON.CORNER_RADIUS
        clipsToBounds = true
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.font = CONST.UI.BUTTON.FONT
        titleLabel?.textColor = CONST.UI.BUTTON.FONT_COLOR
        
        addTarget(self, action: #selector(self.pushDown(_:)), for: UIControlEvents.touchDown)
        addTarget(self, action: #selector(self.pushUp(_:)), for: UIControlEvents.touchUpInside)
    }
    
    @objc private func pushDown(_ sender: UITapGestureRecognizer) {
        layer.backgroundColor = CONST.UI.BUTTON.PRESSED_COLOR.cgColor
        layer.borderColor = CONST.UI.BUTTON.COLOR.cgColor
        
    }
    
    @objc private func pushUp(_ sender: UITapGestureRecognizer) {
        layer.backgroundColor = CONST.UI.BUTTON.COLOR.cgColor
        layer.borderColor = CONST.UI.BUTTON.BORDER_COLOR.cgColor
    }
}

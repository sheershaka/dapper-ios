//
//  DAPTextFIeld.swift
//  Dapper
//
//  Created by Zach Dingels on 8/25/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit

class DAPTextField: MadokaTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = CONST.UI.TEXT_FIELD.COLOR
        layer.cornerRadius = CONST.UI.TEXT_FIELD.CORNER_RADIUS
        layer.borderWidth = CONST.UI.TEXT_FIELD.BORDER_THICCC
        layer.borderColor = CONST.UI.TEXT_FIELD.BORDER_COLOR.cgColor
        clipsToBounds = true
        
        font = CONST.UI.TEXT_FIELD.FONT
        textColor = CONST.UI.TEXT_FIELD.FONT_COLOR
        placeholderColor = CONST.UI.TEXT_FIELD.FONT_COLOR
        
    }
}

//
//  DAPLogoView.swift
//  Dapper
//
//  Created by Zach Dingels on 8/24/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//
//

import Foundation
import UIKit

class _DAPLogoView: UIView {
    
    var logoView: UIImageView {
        let width: CGFloat = self.frame.width * 1.1
        let height: CGFloat = self.frame.height * 1.15
        let x: CGFloat = (-15 / 414) * self.frame.width
        let y: CGFloat = (-130 / 736) * self.frame.height
        
        let logoView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        logoView.image = UIImage(named: "large_logo.png")
        return logoView
    }
    
    var titleView: UIImageView {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.TITLE_IMG.SIDE_MARGIN)
        let height: CGFloat = self.frame.height / 7
        let x: CGFloat = self.frame.width * CONST.UI.TITLE_IMG.SIDE_MARGIN
        let y: CGFloat = self.frame.height * (1 - CONST.UI.FRAME.BOTTOM_MARGIN) - height
        
        let logoView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        logoView.image = UIImage(named: "dapper_title.png")
        return logoView
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        setupView()
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        endEditing(true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = CONST.UI.BACKGROUND_COLOR
        addSubview(logoView)
        addSubview(titleView)
        
        setupLayout()
    }
    
    private func setupLayout() {
    }
}

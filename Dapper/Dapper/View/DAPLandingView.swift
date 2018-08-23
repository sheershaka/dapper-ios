//
//  BGLogoView.swift
//  Dapper
//
//  Created by Zach Dingels on 8/20/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit

class DAPLandingView: UIView {
    
    var logo: UIImageView {
        let logo = UIImageView(image: UIImage(contentsOfFile: "large_logo.png"))
        return logo
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .blue
        print("hello")
        //addSubview(logo)
        setupLayout()
    }
    
    private func setupLayout() {
    }
}

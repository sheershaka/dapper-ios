//
//  DAPSignUpViewController.swift
//  Dapper
//
//  Created by Zach Dingels on 8/25/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit

class DAPConfirmationViewController: DAPViewController {
    
    var DAPView: DAPConfirmationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DAPView = DAPConfirmationView(frame: self.view.frame)
        
        DAPView?.submitButton.addTarget(self, action: #selector(self.submitPressed(_:)), for: UIControlEvents.touchUpInside)
        DAPView?.cancelButton.addTarget(self, action: #selector(self.cancelPressed(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(DAPView!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func submitPressed(_ sender: UITapGestureRecognizer) {
        
    }
    
    func cancelPressed(_ sender: UITapGestureRecognizer) {
        let vc = DAPLandingViewController()
        present(vc, animated: true)
    }
}


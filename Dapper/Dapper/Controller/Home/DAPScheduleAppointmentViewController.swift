//
//  DAPScheduleAppointmentViewController.swift
//  Dapper
//
//  Created by Zach Dingels on 9/2/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import UIKit
import Foundation

class DAPScheduleAppointmentViewController: DAPViewController {
    
    var DAPView: DAPScheduleAppointmentView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DAPView = DAPScheduleAppointmentView(frame: self.view.frame)
        
        DAPView?.servicePicker.delegate = self
        DAPView?.servicePicker.dataSource = self
        
        DAPView?.continueButton.addTarget(self, action: #selector(self.continuePressed(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(DAPView!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func continuePressed(_ sender: UITapGestureRecognizer) {
        //let vc = DAPSignInViewController()
        //present(vc, animated: true)
    }
}

extension DAPScheduleAppointmentViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CONST.APPOINTMENT.SERVICES.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let item = String(CONST.APPOINTMENT.SERVICES[row])!
        return NSAttributedString(string: item, attributes: [NSForegroundColorAttributeName: UIColor.white])
    }
}

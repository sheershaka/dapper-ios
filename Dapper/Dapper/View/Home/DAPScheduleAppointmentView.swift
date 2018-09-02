//
//  DAPScheduleAppointmentView.swift
//  Dapper
//
//  Created by Zach Dingels on 9/2/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit

class DAPScheduleAppointmentView: _DAPLogoView {
    
//    var titleLabel: UILabel = UILabel()
    var datePicker: UIDatePicker = UIDatePicker()
    var servicePicker: UIPickerView = UIPickerView()
    var continueButton: DAPButton = DAPButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupTitleLabel()
        setupDatePicker()
        setupServicePicker()
        setupContinueButton()
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    private func setupTitleLabel() {
//        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
//        let height: CGFloat = self.frame.height * 0.2
//        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
//        let y: CGFloat = self.frame.height * CONST.UI.TITLE.TOP_MARGIN
//
//        titleLabel.frame = CGRect(x: x, y: y, width: width, height: height)
//
//        titleLabel.text = CONST.UI.TEXT.SCHEDULE_APPOINTMENT_TITLE
//        titleLabel.lineBreakMode = .byWordWrapping
//        titleLabel.numberOfLines = 2
//        titleLabel.font = CONST.UI.TITLE.FONT
//        titleLabel.textColor = CONST.UI.TITLE.COLOR
//
//    }
    
    private func setupDatePicker() {
        // TODO Set limits on the times
        let width: CGFloat = self.frame.width
        let height: CGFloat = self.frame.height * CONST.UI.DATE_PICKER.HEIGHT
        let x: CGFloat = 0
        //let y: CGFloat = titleLabel.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        let y: CGFloat = self.frame.height * CONST.UI.FRAME.TOP_MARGIN
        datePicker.frame = CGRect(x: x, y: y, width: width, height: height)
        
        datePicker.backgroundColor = CONST.UI.DATE_PICKER.COLOR
        datePicker.setValue(CONST.UI.DATE_PICKER.TEXT_COLOR, forKey: "textColor")
        
        datePicker.minuteInterval = 15
    }
    
    private func setupServicePicker() {
        let width: CGFloat = self.frame.width
        let height: CGFloat = self.frame.height * CONST.UI.SERVICE_PICKER.HEIGHT
        let x: CGFloat = 0
        let y: CGFloat = datePicker.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
        servicePicker.frame = CGRect(x: x, y: y, width: width, height: height)
        
        servicePicker.backgroundColor = CONST.UI.SERVICE_PICKER.COLOR
        // servicePicker.setValue(CONST.UI.DATE_PICKER.TEXT_COLOR, forKey: "textColor")
        // color is set in datasource delegate
    }
    
    private func setupContinueButton() {
        let width: CGFloat = self.frame.width * (1 - 2 * CONST.UI.FRAME.SIDE_MARGIN)
        let height: CGFloat = CONST.UI.BUTTON.HEIGHT
        let x: CGFloat = self.frame.width * CONST.UI.FRAME.SIDE_MARGIN
        let y: CGFloat = servicePicker.frame.maxY + self.frame.height * CONST.UI.TEXT_FIELD.TEXT_FIELD_MARGIN
        
        continueButton.frame = CGRect(x: x, y: y, width: width, height: height)
        
        continueButton.setTitle("Continue", for: .normal)
    }
    
    private func addViews() {
//        addSubview(titleLabel)
        addSubview(datePicker)
        addSubview(servicePicker)
        addSubview(continueButton)
    }
}

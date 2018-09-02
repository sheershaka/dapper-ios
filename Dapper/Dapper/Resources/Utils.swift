//
//  Utils.swift
//  Dapper
//
//  Created by Zach Dingels on 8/23/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import UIKit

class DAPUtils {
    static func alert(title: String, message: String, buttonMessage: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let retryAction = UIAlertAction(title: buttonMessage, style: .default, handler: nil)
        alertController.addAction(retryAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}

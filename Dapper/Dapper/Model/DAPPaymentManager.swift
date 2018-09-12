//
//  DAPPaymentManager.swift
//  Dapper
//
//  Created by Zach Dingels on 8/31/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation
import BraintreeDropIn
import Braintree

// Class: ParentClass is the syntax for subclassing so in this case we are making a class called
// DAPPaymentManager and its a subclass of NSObject. NSObject is basically the default class that everything inherits from
// https://developer.apple.com/documentation/objectivec/nsobject
class DAPPaymentManager: NSObject {
    
    // Let makes a constant
    let unchangeableVariable: NSInteger = 2;
    // var makes a variable
    var changeableVariable: String = "This variable can be set"
    
    // All classes in Swift use init for their constructor
    init(param1: String, param2: Float) {
        // Super calls the parent classes constructor
        super.init()
        changeableVariable = param1
    }
    
    func doSomething() {
        print("Hello world")
    }
    
    private func onlyCallableFromInsideTheClass() {
        
    }
    
    func fetchClientToken() {
        // TODO: Switch this URL to your own authenticated API
        let clientTokenURL = NSURL(string: "https://cognito-idp.us-west-2.amazonaws.com/us-west-2_96PLwtoLp/.well-known/jwks.json")!
        let clientTokenRequest = NSMutableURLRequest(url: clientTokenURL as URL)
        clientTokenRequest.setValue("text/plain", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: clientTokenRequest as URLRequest) { (data, response, error) -> Void in
            // TODO: Handle errors
            let clientToken = String(data: data!, encoding: String.Encoding.utf8)
            print(clientToken!)
            self.showDropIn(clientTokenOrTokenizationKey: clientToken!)
            // As an example, you may wish to present Drop-in at this point.
            // Continue to the next section to learn more...
            }.resume()
    }
    
    func showDropIn(clientTokenOrTokenizationKey: String) {
        let request =  BTDropInRequest()
        let dropIn = BTDropInController(authorization: clientTokenOrTokenizationKey, request: request)
        { (controller, result, error) in
            if (error != nil) {
                print("ERROR")
            } else if (result?.isCancelled == true) {
                print("CANCELLED")
            } else if let result = result {
                // Use the BTDropInResult properties to update your UI
                //result.paymentOptionType
                //result.paymentMethod
                //result.paymentIcon
                //result.paymentDescription
            }
            controller.dismiss(animated: true, completion: nil)
        }
        //self.present(dropIn!, animated: true, completion: nil)
    }
    /*
    func postNonceToServer(paymentMethodNonce: String) {
        // Update URL with your server
        let paymentURL = URL(string: "https://your-server.example.com/payment-methods")!
        var request = URLRequest(url: paymentURL)
        request.httpBody = "payment_method_nonce=\(paymentMethodNonce)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            // TODO: Handle success or failure
            }.resume()
    }*/
}

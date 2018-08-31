//
//  DAPPaymentManager.swift
//  Dapper
//
//  Created by Zach Dingels on 8/31/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import Foundation

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
    
}

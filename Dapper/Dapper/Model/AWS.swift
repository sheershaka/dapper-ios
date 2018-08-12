//
//  UserPool.swift
//  Dapper
//
//  Created by Zach Dingels on 8/9/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//
// The point of this class is to make it so important AWS objects can be accessed
// from anywhere in the app.

import Foundation

import AWSMobileClient
import AWSCore
import AWSCognitoIdentityProvider

final class AWS {
    
    var pool: AWSCognitoIdentityUserPool?
    var currentUser: AWSCognitoIdentityUser?
    private var hasConfigured: Bool
    
    static let shared = AWS()
    
    private init() {
        self.pool = nil
        self.hasConfigured = false
    }
    
    
    func setAWSServiceConfiguration(config: AWSServiceConfiguration) {
        // This function shouldn't be called more than once.
        if self.hasConfigured {
            return
        }
        self.hasConfigured = true
        
        initalizePool(config: config)
        
    }
    
    func initalizePool(config: AWSServiceConfiguration) {
        let configuration = AWSCognitoIdentityUserPoolConfiguration.init(clientId: CONST.CLIENT_ID, clientSecret: CONST.CLIENT_SECRET, poolId: CONST.POOL_ID)
        AWSCognitoIdentityUserPool.register(with: config, userPoolConfiguration: configuration, forKey: "UserPool")
        self.pool = AWSCognitoIdentityUserPool(forKey: "UserPool")
        
        if self.pool == nil {
            print("Error connecting to AWS: cannot initialize User Pool")
        } else {
            self.currentUser = self.pool!.getUser()
        }
    }
}

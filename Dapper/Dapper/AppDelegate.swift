//
//  AppDelegate.swift
//  Dapper
//
//  Created by Zach Dingels on 8/1/18.
//  Copyright © 2018 Zach Dingels. All rights reserved.
//

import UIKit
import AWSMobileClient
import AWSCore
import AWSCognitoIdentityProvider
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    // Add a AWSMobileClient call in application:open url
    func application(_ application: UIApplication, open url: URL,
                     sourceApplication: String?, annotation: Any) -> Bool {
        
        return AWSMobileClient.sharedInstance().interceptApplication(
            application, open: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
    }
    
    // Add a AWSMobileClient call in application:didFinishLaunching
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        setupAWS()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        var landingVC: DAPViewController = DAPLandingViewController()
//        if (AWS.shared.pool?.currentUser()?.isSignedIn)! {
//            landingVC = DAPScheduleAppointmentViewController()
//            print(AWS.shared.pool?.currentUser()?.username)
//        }
//        if FBSDKAccessToken.currentAccessTokenIsActive() {
//            landingVC = DAPScheduleAppointmentViewController()
//        }
        
        self.window?.rootViewController = landingVC
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func setupAWS() {
        // Configure
        //let credentialsProvider = AWSCognitoCredentialsProvider(regionType: CONST.AWS.REGION, identityPoolId: CONST.AWS.COGNITO.IDENTITY_POOL_ID, identityProviderManager: FacebookProvider())
        //let credentialsProvider = AWSCognitoCredentialsProvider(regionType: CONST.AWS.REGION, identityPoolId: CONST.AWS.COGNITO.IDENTITY_POOL_ID, identityProviderManager: AWS.shared.pool)
        
        let configuration = AWSServiceConfiguration(region: CONST.AWS.REGION, credentialsProvider: nil)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        // Logging
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        AWSDDLog.sharedInstance.logLevel = .verbose
        
        // AWS Cognito User Pool
        AWS.shared.setAWSServiceConfiguration(config: configuration!)
        AWS.shared.pool?.delegate = self
    
    }
}


extension AppDelegate: AWSCognitoIdentityInteractiveAuthenticationDelegate {
    // This function is called whenever we try and use AWSCognito and we don't have a
    // user logged in. So, inside the function is code to show the login view controller
    func startPasswordAuthentication() -> AWSCognitoIdentityPasswordAuthentication {
        let signInVC = DAPSignInViewController()
        
        self.window?.rootViewController = signInVC
        self.window?.makeKeyAndVisible()
        
        return signInVC
    }
    
    // AWS Cognito has different states for user accounts. One state is that the
    // user needs to change their password. This is the default state for users
    // created on the AWS website When a user tries to log on and their
    // account is in the "change password" state this function gets called.
    // We shouldn't need to worry about this because users will be signing up
    // on the app, not the AWS website. Notice that if you try and log in
    // using the username and password of one of the accounts made on AWS
    // this function gets called.
//    func startNewPasswordRequired() -> AWSCognitoIdentityNewPasswordRequired {
//        print("called-startNewPassword")
//        return self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LogInViewController as! AWSCognitoIdentityNewPasswordRequired
//    }
}

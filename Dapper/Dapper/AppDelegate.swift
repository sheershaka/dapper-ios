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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var serviceConfiguration: AWSServiceConfiguration!
    var pool: AWSCognitoIdentityUserPool!
    var currentUser: AWSCognitoIdentityUser!

    // Add a AWSMobileClient call in application:open url
    func application(_ application: UIApplication, open url: URL,
                     sourceApplication: String?, annotation: Any) -> Bool {
        
        return AWSMobileClient.sharedInstance().interceptApplication(
            application, open: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
        
    }
    
    // Add a AWSMobileClient call in application:didFinishLaunching
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Configure AWS
        self.serviceConfiguration = AWSServiceConfiguration.init(region: AWSRegionType.USWest2, credentialsProvider: nil)
        if self.serviceConfiguration == nil {
            print("Error connecting to AWS: cannot initialize serviceConfiguration")
        }
        
        initUserPool()
        
        // setInitialView()
        
        // Logging, use to test if AWS is connecting
        //AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        //AWSDDLog.sharedInstance.logLevel = .verbose
        
        return AWSMobileClient.sharedInstance().interceptApplication(
            application, didFinishLaunchingWithOptions:
            launchOptions)
    }
    
    func initUserPool() {
        let configuration = AWSCognitoIdentityUserPoolConfiguration.init(clientId: CONST.CLIENT_ID, clientSecret: CONST.CLIENT_SECRET, poolId: CONST.POOL_ID)
        AWSCognitoIdentityUserPool.register(with: self.serviceConfiguration, userPoolConfiguration: configuration, forKey: "UserPool")
        self.pool = AWSCognitoIdentityUserPool(forKey: "UserPool")
        if self.pool == nil {
            print("Error connecting to AWS: cannot initialize User Pool")
        }
    }
    
    func setInitialView() {
        
        //        self.window = UIWindow(frame: UIScreen.main.bounds)
        //        let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
        //        let viewController = storyboard.instantiateViewController(withIdentifier: <#T##String#>)
        //
        //        // Assume user is logged in
        //        var secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        //
        //        self.currentUser = pool.currentUser()
        //        if self.currentUser == nil {
        //            // This will run if the currentUser() is nil aka not logged in
        //            self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        //        }
        //
        //        self.window?.rootViewController = viewController
        //        self.window?.makeKeyAndVisible()
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


}


//
//  AppDelegate.swift
//  Helga
//
//  Created by Sajjad Aboutalebi on 11/8/17.
//  Copyright © 2017 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import CoreLocation



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var alocationManager: LocationManager!
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        
        alocationManager = LocationManager()
        if ((launchOptions?[UIApplicationLaunchOptionsKey.location]) != nil) {
            alocationManager.saveFromBackground()
            alocationManager.startmonitoring()
        }
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        alocationManager.restartmonitoring()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        alocationManager.startmonitoring()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


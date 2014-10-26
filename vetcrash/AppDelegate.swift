//
//  AppDelegate.swift
//  vetcrash
//
//  Created by Andrew Folta on 10/24/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


var DOSE_FORMATTER = NSNumberFormatter()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var settings = Settings()
    var currentPatient: Patient?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        DOSE_FORMATTER.numberStyle = .DecimalStyle
        DOSE_FORMATTER.maximumSignificantDigits = 2
        return true
    }

//    func applicationWillResignActive(application: UIApplication) {
//    }
//
//    func applicationDidEnterBackground(application: UIApplication) {
//    }
//
//    func applicationWillEnterForeground(application: UIApplication) {
//    }
//
//    func applicationDidBecomeActive(application: UIApplication) {
//    }
//
//    func applicationWillTerminate(application: UIApplication) {
//    }
}


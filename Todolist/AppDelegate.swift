//
//  AppDelegate.swift
//  Todolist
//
//  Created by Lilya on 12/08/2019.
//  Copyright © 2019 Lilya. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        
        return true
        // gets called when your app gets loaded up.
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
        // Not terminating the progress if the user clicks out for a bit.
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        // happens when the app dissapears of the screen. i. e gets shifted back like you would do with a deck of cards for example.
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        // when your app is hogging all data the app will be assisinated by the operatingsystem.
        // or if the user double clicks on the home button an swipes your app up then it will get assinated too.
    }


}


//
//  AppDelegate.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/25.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    ///字体缩放比例
    var fontSize:CGFloat = 0.0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        createRootController()
        fontSizeScale()
        return true
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


    ///设置根视图
    func createRootController() {
        self.window = UIWindow(frame: SCREEN_RECT)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = LookAtTabBarViewController()
    }
    
    ///font size scale
    func fontSizeScale(withScale scale:CGFloat) -> CGFloat {
        return self.fontSize*scale
    }
    
    ///font size scale
    func fontSizeScale() {
        if iPhone8P || iPhoneXSMax || iPhoneXR {
            self.fontSize = 1.1
        } else if iPhone8 || iPhoneX {
            self.fontSize = 1.0
        } else if iPhoneSE {
            self.fontSize = 0.9
        } else if iPhone4s {
            self.fontSize = 0.7
        } else {
            self.fontSize = 1.5
        }
    }
}


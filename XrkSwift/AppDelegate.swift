//
//  AppDelegate.swift
//  XrkSwift
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit

@UIApplicationMain



class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var tabbar :UITabBarController?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
 
        let tabbarC = UITabBarController.init()
        tabbar = tabbarC
        
        kaddChildVc(vc: HomeViewController(), title: "首页", imageName: "tabbar_home", imageSelect: "tabbar_home_selected")
        kaddChildVc(vc: PlaceAnOrderVC(), title: "re", imageName: "tabbar_message_center", imageSelect: "tabbar_message_center_selected")
        kaddChildVc(vc: MeCenterViewController(), title: "我的", imageName: "tabbar_profile", imageSelect: "tabbar_profile_selected")
        
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = UIColor.white
        window?.rootViewController = tabbarC
        window?.makeKeyAndVisible()
        
        

        return true
    }

    func kaddChildVc(vc: UIViewController, title: String , imageName: String, imageSelect: String)  {
        vc.tabBarItem.title = title
        vc.tabBarItem.selectedImage = UIImage.init(named: imageSelect)
        vc.tabBarItem.image = UIImage.init(named: imageName)
        let nav = UINavigationController.init(rootViewController: vc)
        nav.title = title
        nav.hidesBottomBarWhenPushed = true
        tabbar?.addChildViewController(nav)
        
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


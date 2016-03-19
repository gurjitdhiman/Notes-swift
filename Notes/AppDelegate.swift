//
//  AppDelegate.swift
//  Notes
//
//  Created by Gurpartap Singh on 04/03/16.
//  Copyright © 2016 Example. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 1.Set a initial window for project.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // 2.Set a Notes view.
        let notesViewController = NotesViewController(nibName: "NotesView", bundle: nil)
        notesViewController.title = "Notes"
        
        // 3.Set a Navigation and set its initial view as Notes view.
        let navController = UINavigationController(rootViewController: notesViewController)
        
        // 4.Set a table bar view and add Navigation controller in view array.
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navController]
        
        // 5.Add table bar to main Window View and make it visible.
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {}

    func applicationDidEnterBackground(application: UIApplication) {}

    func applicationWillEnterForeground(application: UIApplication) {}

    func applicationDidBecomeActive(application: UIApplication) {}

    func applicationWillTerminate(application: UIApplication) {}


}


//
//  AppDelegate.swift
//  Marvel
//
//  Created by Marco Domingues on 31/01/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = BaseNavigationController(rootViewController: ComicsViewController())
        window?.makeKeyAndVisible()
        
        return true
    }

}

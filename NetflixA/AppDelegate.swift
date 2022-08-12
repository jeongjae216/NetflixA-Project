//
//  AppDelegate.swift
//  NetflixA
//
//  Created by 정재 on 2022/01/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = SplashViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}


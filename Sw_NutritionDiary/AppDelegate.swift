//
//  AppDelegate.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 08.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = MainNavigationController()
        
        let attributesNormal = [
            NSAttributedString.Key.foregroundColor : UIColor.darkGray,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)
        ]
        let attributesSelected = [
            NSAttributedString.Key.foregroundColor : UIColor.init(red: 55.0/255.0, green: 54.0/255.0, blue: 104.0/255.0, alpha: 1),
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)
      
            //  NSAttributedString.Key.font : UIFont(name: "American Typewriter", size: 22.0)!
        ]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributesNormal, for: UIControl.State.normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributesSelected, for: UIControl.State.selected)
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }

//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}


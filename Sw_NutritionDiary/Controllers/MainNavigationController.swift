//
//  MainNavigationController.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 13.08.2021.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        NetworkManager.shared.GetProfile(accessToken: SettingsManager.shared.token ?? "") { obj in
            SettingsManager.shared.profileId = obj?.id
            SettingsManager.shared.userId = obj?.userId
            print(SettingsManager.shared.profileId as Any)
            print(SettingsManager.shared.userId as Any)
        }
            
        if (SettingsManager.shared.token != "" && SettingsManager.shared.profileId != 0) {
            let mainViewController = getViewControllerByID("mainVC") as! MainTabBarController
            pushViewController(mainViewController, animated: true)
        }
        else if (SettingsManager.shared.userId == "")
        {
            let registerViewController = getViewControllerByID("registerVC") as! SignUpViewController
            pushViewController(registerViewController, animated: true)
        }
        else {
            let loginViewController = getViewControllerByID("loginVC") as! LoginViewController
            pushViewController(loginViewController, animated: true)
        }
    }
    
    
}

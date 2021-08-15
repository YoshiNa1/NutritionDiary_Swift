//
//  LoginViewController.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 09.07.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    public var model: LoginResponse?
    public var profile: ProfileModel?
    public var searchResults: [FoodModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func Login_Clicked(_ sender: UIButton) {
        NetworkManager.shared.LoginUser(email: "swetlana3@gmail.com", password: "swetlana3") { [weak self] object in
            self?.model = object
            SettingsManager.shared.token = (self?.model?.jwtToken)
            SettingsManager.shared.tokenExpirationDate = (self?.model?.expires)!
            SettingsManager.shared.userId = (self?.model?.userId)
        }
        
        NetworkManager.shared.GetProfile(accessToken: SettingsManager.shared.token ?? "") { [weak self] object in
            self?.profile = object
            SettingsManager.shared.profileId = (self?.profile?.id)
        }
        
        NetworkManager.shared.GetSearchResults(keyword: "С", accessToken: SettingsManager.shared.token ?? "") { [weak self] object in
            self?.searchResults = object
            print(self?.searchResults as Any)
        }
        
        print("______________")
        print(SettingsManager.shared.token as Any)
        print(SettingsManager.shared.userId as Any)
        print(SettingsManager.shared.profileId as Any)
        
        if (SettingsManager.shared.profileId != 0) {
            let vc = getViewControllerByID("mainVC") as! MainTabBarController
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let vc = getViewControllerByID("addProfileVC") as! AddProfilePageViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func signUp_Clicked(_ sender: UIButton) {
        let vc = getViewControllerByID("registerVC") as! SignUpViewController
        navigationController?.show(vc, sender: nil)
    }
    
}

//
//  SignUpViewController.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 09.07.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var profileName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func Register_Clicked(_ sender: UIButton) {
        NetworkManager.shared.RegisterUser(name: profileName.text!, email: email.text!, password: password.text!, confirmPassword: confirmPassword.text!)
        SettingsManager.shared.email = email.text!
        SettingsManager.shared.profileName = profileName.text!
        
        let vc = getViewControllerByID("loginVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

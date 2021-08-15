//
//  AddProfilePageViewController.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 08.07.2021.
//

import UIKit

class AddProfilePageViewController: UIViewController {
    
    @IBOutlet weak var MaleButton: RadioButton!
    @IBOutlet weak var FemaleButton: RadioButton!
    
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var ActivityLevelPicker: UIPickerView!
    let levels = ["Activity Level",
                  "Sedentary lifestyle",
                  "Moderate activity (light physical activity or exercise 1-3 times a week)",
                  "Moderate activity (exercise 3-5 times a week)",
                  "High activity (vigorous activity, exercising 6-7 times a week)",
                  "Very high activity"]
    
    @IBOutlet weak var firstGoalButton: RadioButton!
    @IBOutlet weak var secondGoalButton: RadioButton!
    @IBOutlet weak var thirdGoalButton: RadioButton!
    
    public var model: ProfileModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        radioButtonsToggle()
        
        ActivityLevelPicker.delegate = self
        ActivityLevelPicker.dataSource = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

        tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func radioButtonsToggle() {
        MaleButton?.alternateButton = [FemaleButton!]
        FemaleButton?.alternateButton = [MaleButton!]
        firstGoalButton?.alternateButton = [secondGoalButton!, thirdGoalButton!]
        secondGoalButton?.alternateButton = [firstGoalButton!, thirdGoalButton!]
        thirdGoalButton?.alternateButton = [secondGoalButton!, firstGoalButton!]
    }
    
    @IBAction func AddProfile_Clicked(_ sender: UIButton) {
        NetworkManager.shared.AddProfile(gender: "Female", age: 42, weight: 48, height: 160, activityLevel: 1.2, goal: 1, accessToken: SettingsManager.shared.token ?? "") { [weak self] object in
            self?.model = object
            SettingsManager.shared.profileId = (self?.model?.id)!
        }
        
        let vc = getViewControllerByID("mainVC") as! MainTabBarController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - PickerView extension
extension AddProfilePageViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return levels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: levels[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return levels[row]
    }
}

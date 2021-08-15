//
//  UIViewController+Storyboard.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 12.08.2021.
//

import UIKit

extension UIViewController {
    
    func getViewControllerByID(_ id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: id)
    }
}

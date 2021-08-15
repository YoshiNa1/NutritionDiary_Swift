//
//  CustomTabBar.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 09.07.2021.
//

import UIKit

class CustomTabBar: UITabBar {

     override func sizeThatFits(_ size: CGSize) -> CGSize {
          var size = super.sizeThatFits(size)
          size.height = 70
          return size
     }
}

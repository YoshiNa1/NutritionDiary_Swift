//
//  RadioButton.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 08.07.2021.
//

import UIKit

class RadioButton: UIButton {

    var alternateButton:Array<RadioButton>?
        
        override func awakeFromNib() {
            self.layer.cornerRadius = 10
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.lightGray.cgColor
            self.layer.masksToBounds = true
        }
        
        func unselectAlternateButtons() {
            if alternateButton != nil {
                self.isSelected = true
                
                for aButton:RadioButton in alternateButton! {
                    aButton.isSelected = false
                }
            } else {
                toggleButton()
            }
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            unselectAlternateButtons()
            super.touchesBegan(touches, with: event)
        }
        
        func toggleButton() {
            self.isSelected = !isSelected
        }
        
        override var isSelected: Bool {
            didSet {
                if isSelected {
                    self.layer.borderColor = UIColor.init(red: 104, green: 255, blue: 118, alpha: 1).cgColor
                    self.layer.backgroundColor = UIColor.init(red: 104, green: 255, blue: 118, alpha: 1).cgColor
                } else {
                    self.layer.backgroundColor = UIColor.white.cgColor
                    self.layer.borderColor = UIColor.darkGray.cgColor
                }
            }
        }
}

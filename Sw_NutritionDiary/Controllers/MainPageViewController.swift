//
//  MainPageViewController.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 08.07.2021.
//

import UIKit
import MBCircularProgressBar

class MainPageViewController: UIViewController {

    let shape = CAShapeLayer()
    
//    @IBOutlet weak var ConsumedLabel: UILabel!
//    @IBOutlet weak var ResultLabel: UILabel!
    
    @IBOutlet weak var progressBar: MBCircularProgressBarView!
    
    @IBOutlet weak var CaloriesButton: UIButton!
    @IBOutlet weak var ProteinsButton: UIButton!
    @IBOutlet weak var FatsButton: UIButton!
    @IBOutlet weak var CarbsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressBar.unitString = " / \(Int(progressBar.maxValue))"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func caloriesButton_Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: { self.progressBar.value = 1100 })
        progressBar.progressColor = UIColor.green
        progressBar.maxValue = 1269
        progressBar.unitString = " / \(Int(progressBar.maxValue))"
    }
    @IBAction func protsButton_Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: { self.progressBar.value = 23 })
        progressBar.progressColor = UIColor.blue
        progressBar.maxValue = 95
        progressBar.unitString = " / \(Int(progressBar.maxValue))"
    }
    
    @IBAction func fatsButton_Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: { self.progressBar.value = 26 })
        progressBar.progressColor = UIColor.purple
        progressBar.maxValue = 63
        progressBar.unitString = " / \(Int(progressBar.maxValue))"
    }
    @IBAction func carbsButton_Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: { self.progressBar.value = 110 })
        progressBar.progressColor = UIColor.red
        progressBar.maxValue = 159
        progressBar.unitString = " / \(Int(progressBar.maxValue))"
    }
    
    @IBAction func menu_Clicked(_ sender: UIButton) {
        showMiracle()
    }
    
    func showMiracle() {
        let slideVC = MenuView()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }

}

//MARK: - extension for MenuView
extension MainPageViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}


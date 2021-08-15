//
//  MealsMainPageViewController.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 09.07.2021.
//

import UIKit

class MealsMainPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var SearchFoodBar: UISearchBar!
    @IBOutlet weak var MealsTable: UITableView!
    
    let meals : [String]  = ["Breakfast",
                             "Second Breakfast",
                             "Dinner",
                             "Second Dinner",
                             "Evening Meal",
                             "Second Evening Meal"]
    
    let foods : [String]  = ["Food 1", "Food 2", "Food 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MealsTable.delegate = self
        MealsTable.dataSource = self
        
        MealsTable.sectionHeaderHeight = 40
        MealsTable.rowHeight = 60
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

        tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func editButton_Clicked(_ sender: UIButton) {
        print("Edit Button Clicked")
    }
    @IBAction func deleteButton_Clicked(_ sender: UIButton) {
        print("Delete Button Clicked")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MealsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = foods[indexPath.row]
        cell.textLabel?.textColor = UIColor.darkGray
        return cell
    }
    
  
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }

//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//    }

    
}

//
//class Food {
//    let name : String
//
//    init(_ name:String) {
//        self.name = name
//    }
//}
//
//
//class Meal {
//    let name : String
//    let foods : [Food]
//
//    init(_ name:String, foods:[Food]) {
//        self.name = name
//        self.foods = foods
//    }
//}

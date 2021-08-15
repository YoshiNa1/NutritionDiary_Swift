//
//  FoodModel.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 09.08.2021.
//

import Foundation
import ObjectMapper

struct FoodModel : Mappable {
    var id : Int?
    var foodName : String?
    var calories : Int?
    var proteins : Double?
    var fats : Int?
    var carbs : Double?
    var caloriesConsumed : Int?
    var proteinsConsumed : Int?
    var fatsConsumed : Int?
    var carbsConsumed : Int?
    var weight : Int?
    var mealsBindingModelId : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        foodName <- map["foodName"]
        calories <- map["calories"]
        proteins <- map["proteins"]
        fats <- map["fats"]
        carbs <- map["carbs"]
        caloriesConsumed <- map["caloriesConsumed"]
        proteinsConsumed <- map["proteinsConsumed"]
        fatsConsumed <- map["fatsConsumed"]
        carbsConsumed <- map["carbsConsumed"]
        weight <- map["weight"]
        mealsBindingModelId <- map["mealsBindingModelId"]

    }

}

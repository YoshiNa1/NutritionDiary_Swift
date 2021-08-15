//
//  ProfileModel.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 09.08.2021.
//

import Foundation
import ObjectMapper

struct ProfileModel : Mappable {
    var id : Int?
    var gender : String?
    var age : Int?
    var weight : Int?
    var height : Int?
    var activityLevel : Double?
    var goal : Double?
    var metabolism : Double?
    var bmi : Double?
    var result : Double?
    var proteins : Double?
    var fats : Double?
    var carbs : Double?
    var userId : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        gender <- map["gender"]
        age <- map["age"]
        weight <- map["weight"]
        height <- map["height"]
        activityLevel <- map["activityLevel"]
        goal <- map["goal"]
        metabolism <- map["metabolism"]
        bmi <- map["bmi"]
        result <- map["result"]
        proteins <- map["proteins"]
        fats <- map["fats"]
        carbs <- map["carbs"]
        userId <- map["userId"]
    }

}

//
//  Register.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 08.08.2021.
//

import Foundation
import ObjectMapper

struct RegisterModel : Mappable {
    var profileName : String?
    var email : String?
    var password : String?
    var confirmPassword : String?

    init?(map: Map) {

    }
    mutating func mapping(map: Map) {

        profileName <- map["ProfileName"]
        email <- map["Email"]
        password <- map["Password"]
        confirmPassword <- map["ConfirmPassword"]
    }

}

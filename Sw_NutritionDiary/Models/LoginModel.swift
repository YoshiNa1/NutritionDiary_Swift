//
//  LoginModel.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 09.08.2021.
//

import Foundation
import ObjectMapper

struct LoginModel : Mappable{
    var email: String?
    var password: String?
    
    init?(map: Map) {

    }
    mutating func mapping(map: Map) {
        email <- map["Email"]
        password <- map["Password"]
    }
}

struct LoginResponse : Mappable{
    var email: String?
    var jwtToken: String?
    var userId: String?
    var expires: String?
    var isValid: Bool?
    
    init?(map: Map) {

    }
    mutating func mapping(map: Map) {
        email <- map["email"]
        jwtToken <- map["jwtToken"]
        userId <- map["userId"]
        expires <- map["expires"]
        isValid <- map["isValid"]
    }
}

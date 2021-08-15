//
//  NetworkManager.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 08.08.2021.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    let baseURL = "http://217.25.94.57/api/"
        
    func RegisterUser(name: String, email: String, password: String, confirmPassword: String) {
       
        let json: [String: Any] = ["profileName": name,
                                   "email": email,
                                   "password": password,
                                   "confirmPassword": confirmPassword]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: URL(string: "\(baseURL)User/Register")!)
        request.httpBody = jsonData
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        AF.request(request).responseData { (response) in
            print("Response: \(String(describing: response.response?.statusCode))")
        }
    }
    
    func LoginUser(email: String, password: String, completion: @escaping (LoginResponse?) -> Void) {
        
        let model : [String:String] = [
            "email" : email,
            "password": password ]
        
        AF.request("\(baseURL)User/Login", method: .post, parameters: model, encoding: URLEncoding.default)
            .responseObject { (response: DataResponse<LoginResponse, AFError>) in
                let obj = try? response.result.get()
                completion(obj)
        }
        
    }
    
    func AddProfile(gender: String, age: Int, weight: Double, height: Double, activityLevel: Double, goal: Double, accessToken: String, completion: @escaping (ProfileModel?) -> Void) {
        
        let json: [String: Any] = ["gender": gender,
                                   "age": age,
                                   "weight": weight,
                                   "height": height,
                                   "activityLevel": activityLevel,
                                   "goal": goal]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: URL(string: "\(baseURL)App/AddProfile")!)
        request.httpBody = jsonData
        request.httpMethod = HTTPMethod.post.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        AF.request(request).responseObject { (response: DataResponse<ProfileModel, AFError>) in
            let obj = try? response.result.get()
            completion(obj)
        }
    }
    
    func GetProfile(accessToken: String, completion: @escaping (ProfileModel?) -> Void) {
        var request = URLRequest(url: URL(string: "\(baseURL)App/GetProfile")!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        AF.request(request).responseObject { (response: DataResponse<ProfileModel, AFError>) in
            let obj = try? response.result.get()
            completion(obj)
        }
    }
    
    
    func GetSearchResults(keyword: String, accessToken: String, completion:  @escaping ([FoodModel]?) -> Void) {
        let url = "\(baseURL)App/SearchFoods/\(keyword)"
        let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        var request = URLRequest(url: URL(string: encodedUrl)!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        AF.request(request).responseArray { (response: DataResponse<[FoodModel], AFError>) in
            let obj = try? response.result.get()
            completion(obj)
        }
        
    }
    
}

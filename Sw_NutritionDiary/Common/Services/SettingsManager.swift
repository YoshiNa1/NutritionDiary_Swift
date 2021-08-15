//
//  SettingsManager.swift
//  Sw_NutritionDiary
//
//  Created by Anastasiia on 09.08.2021.
//

import Foundation

class SettingsManager {
    static let shared = SettingsManager()
    private init() {}
    private var storage = UserDefaults()
    
    public var token: String? {
        get {
            return storage.string(forKey: "token")
        }
        set {
            storage.setValue(newValue, forKey: "token")
        }
    }
    
    public var tokenExpirationDate: String {
        get {
            return storage.string(forKey: "tokenExpirationDate")!
        }
        set {
            storage.setValue(newValue, forKey: "tokenExpirationDate")
        }
    }
    
    public var email: String {
        get {
            return storage.string(forKey: "email")!
        }
        set {
            storage.setValue(newValue, forKey: "email")
        }
    }
    
    public var profileName: String {
        get {
            return storage.string(forKey: "profileName")!
        }
        set {
            storage.setValue(newValue, forKey: "profileName")
        }
    }
    
    public var userId: String? {
        get {
            return storage.string(forKey: "userId")
        }
        set {
            storage.setValue(newValue, forKey: "userId")
        }
    }
    
    public var profileId: Int? {
        get {
            return storage.integer(forKey: "profileId")
        }
        set {
            storage.setValue(newValue, forKey: "profileId")
        }
    }
    
    
    func clearSettings() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
}

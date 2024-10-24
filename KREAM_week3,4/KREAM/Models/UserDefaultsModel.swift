//
//  UserDefaultModel.swift
//  KREAM
//
//  Created by 서재민 on 10/22/24.
//

import UIKit
class UserDefaultsModel {
    private let userDefaults = UserDefaults.standard
    private let Email: String = "Email"
    private let PasswordKey: String = "Password"
    
    
    public func SaveUserEmail(_ text: String) {
        userDefaults.set(text, forKey: Email)
    }
   
    public func SaveUserPassword(_ text: String) {
        userDefaults.set(text, forKey: PasswordKey)
    }
    public func loadUserEmail() -> String? {
        return userDefaults.string(forKey: Email)
    }
    public func loadUserPassword() -> String? {
        return userDefaults.string(forKey: PasswordKey)
    }
    
}
    
    
    



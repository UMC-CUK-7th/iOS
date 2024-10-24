//
//  LoginModel.swift
//  KREAM
//
//  Created by 류한비 on 10/7/24.
//

import Foundation

/*struct LoginUser {
 var id: String
 var pwd: String
 
 }*/

class LoginModel {
    private let userIpnut = UserDefaults.standard
    // private let loginPWD = UserDefaults.standard
    //private let userTextKey: String = "loginID"
    
    // 유저가 입력한 텍스트 값을 UserDefaults에 저장.
    public func saveUserID(_ text: String) {
        userIpnut.set(text, forKey: "loginID")
    }
    public func saveUserPWD(_ text: String) {
        userIpnut.set(text, forKey: "loginPWD")
    }
    
    // UserDefaults에 저장된 값을 불러옴
    public func loadUserID() -> String? {
        return userIpnut.string(forKey: "loginID")
    }
    public func loadUserPWD() -> String? {
        return userIpnut.string(forKey: "loginPWD")
    }
}


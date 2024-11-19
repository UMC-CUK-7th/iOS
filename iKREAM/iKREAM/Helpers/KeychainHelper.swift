//
//  KeychainHelper.swift
//  iKREAM
//
//  Created by 김윤진 on 11/13/24.
//

import Foundation
import Security

struct KeychainHelper {
    static func save(_ key: String, _ value: String) {
        guard let data = value.data(using: .utf8) else { return }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary) // 기존 항목 삭제
        SecItemAdd(query as CFDictionary, nil) // 새 항목 추가
    }
    
    static func retrieve(_ key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        if SecItemCopyMatching(query as CFDictionary, &result) == noErr {
            if let data = result as? Data, let value = String(data: data, encoding: .utf8) {
                return value
            }
        }
        return nil
    }
    
    // 카카오톡 닉네임 저장
    static func saveKakaoNickname(_ nickname: String) {
        save("kakao_nickname", nickname) // 'kakao_nickname'라는 키로 닉네임 저장
    }
    
    // 카카오톡 닉네임 가져오기
    static func getKakaoNickname() -> String? {
        return retrieve("kakao_nickname") // 'kakao_nickname'라는 키로 닉네임 가져오기
    }
}

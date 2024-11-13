//
//  KeychainService.swift
//  KREAM
//
//  Created by 류한비 on 11/13/24.
//

import Foundation
import Security

class KeychainService {
    
    static let shared = KeychainService()
    
    // 생성자를 private으로 설정하여 외부에서 새로운 인스턴스를 생성하지 못하게 함
    private init() {}
    
    // Keychain에 토큰을 저장하는 함수
    @discardableResult
    func save(token: String, account: String, service: String) -> OSStatus {
        let tokenData = token.data(using: .utf8)!
        
        // 저장할 데이터와 속성을 포함한 쿼리 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,      // 계정 이름
            kSecAttrService as String: service,      // 서비스 이름
            kSecValueData as String: tokenData       // 실제 토큰 데이터
        ]
        
        // 기존 항목이 있으면 삭제
        SecItemDelete(query as CFDictionary)
        
        // 새로운 데이터 저장
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    // Keychain에서 토큰을 불러오는 함수
    func load(account: String, service: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,      // 계정 이름
            kSecAttrService as String: service,      // 서비스 이름
            kSecReturnData as String: kCFBooleanTrue as Any, // 데이터를 반환하도록 설정
            kSecMatchLimit as String: kSecMatchLimitOne      // 하나의 결과만 반환
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess else { return nil }
        
        if let data = item as? Data, let token = String(data: data, encoding: .utf8) {
            return token
        }
        
        return nil
    }
}

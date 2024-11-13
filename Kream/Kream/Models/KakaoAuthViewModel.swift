//
//  KakaoAuthViewModel.swift
//  KREAM
//
//  Created by 류한비 on 11/11/24.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    
    
    //MARK: - KakaoLogin
    @Published // 로그인 여부
    var isLogined: Bool = false
    
    // 카카오톡 앱으로 로그인 인증
    func kakaoLoginWithApp() async -> Bool{
        await withCheckedContinuation{ continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 로그인 실패
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    // 로그인 성공 시 토큰 저장
                    if let token = oauthToken {
                        self.storeTokenAndAccount(oauthToken: token)
                    }
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    // 카카오 계정으로 로그인
    func kakaoLoginWithAcount() async -> Bool{
        await withCheckedContinuation{ continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    // 로그인 실패
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    // 로그인 성공 시 토큰 저장
                    if let token = oauthToken {
                        self.storeTokenAndAccount(oauthToken: token)
                    }
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    @MainActor // 메인스레드에서 작동되게끔
    func handleKakaoLogin() {
        print("KakaoAuthViewModel - handleKakaoLogin() called")
        Task{ // async-await는 Task블록에서 사용
            // 카카오톡 설치 여부 확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                
                // 카카오톡 앱으로 로그인 인증
                isLogined = await kakaoLoginWithApp()
            } else { //카카오톡이 설치가 안 되어 있으면
                
                // 카카오 계정으로 로그인 인증
                isLogined = await kakaoLoginWithAcount()
            }
        }
    }
    
    //MARK: - Keychain
    // 토큰과 닉네임을 Keychain에 저장하는 메서드
    func storeTokenAndAccount(oauthToken: OAuthToken) {
        let token = oauthToken.accessToken
        
        UserApi.shared.me { user, error in
            if let error = error {
                print("Error fetching user info: \(error)")
            }
            else if let nickname = user?.kakaoAccount?.profile?.nickname {
                // 앱의 고유 식별자를 Keychain의 서비스 이름으로 사용
                let service = Bundle.main.bundleIdentifier ?? "KakaoLoginService"
                
                // 토큰과 닉네임을 Keychain에 저장
                let tokenSaveStatus = KeychainService.shared.save(token: token, account: "accessToken", service: service)
                let nicknameSaveStatus = KeychainService.shared.save(token: nickname, account: "userNickname", service: service)
                
                // 저장 확인용
                let nickname = KeychainService.shared.load(account: "userNickname", service: service) // Keychain에 저장된 닉네임을 확인하기 위해 불러옴
                if tokenSaveStatus == errSecSuccess && nicknameSaveStatus == errSecSuccess {
                    print("토큰과 닉네임이 성공적으로 Keychain에 저장되었습니다.")
                    print("저장된 닉네임 : \(nickname)")
                } else {
                    print("Keychain 저장에 실패했습니다. 상태 코드: \(tokenSaveStatus), \(nicknameSaveStatus)")
                }
            }
        }
    }
    
}

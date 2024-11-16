//
//  KakaoAuthViewModel.swift
//  KREAM
//
//  Created by 서재민 on 11/15/24.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser


class KakaoAuthViewModel: ObservableObject {
    var subscription = Set<AnyCancellable>()
    @Published var isLoggedIn: Bool = false
    init(){
        print("KakaoAuthViewModel-init() called")
    }
    
    func kakaoLoginwithApp() async -> Bool {
        await withCheckedContinuation{continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning:  false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    // 성공 시 동작 구현
                    _ = oauthToken
                    continuation.resume(returning: true)
                    if let token = oauthToken {
                        self.getUserInfo(oAuthToken: token)
                    }
                    

                }
            }
            }
    }
    
    func kakaoLoginwithAccount() async -> Bool {
        await withCheckedContinuation{continuation in
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning:  false)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    continuation.resume(returning: true)

                    // 성공 시 동작 구현
                    _ = oauthToken
                    if let token = oauthToken {
                        self.getUserInfo(oAuthToken: token)
                    }
                }
            }
    }
    }
    @MainActor
    func kakaoLogin(){
        print("KakaoAuthViewModel-handleKakakoLogin() called")
        Task{
            //카카오톡 설치여부확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                isLoggedIn = await kakaoLoginwithApp()
            }
            else { //카카오톡 설치가 안되어있으면
                isLoggedIn = await kakaoLoginwithAccount()
            }
        }
    }
    
    func getUserInfo(oAuthToken: OAuthToken) {
        let token = oAuthToken.accessToken
        
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                if let nickname = user?.kakaoAccount?.profile?.nickname{
                    let service = "free_KREAM"
                    let tokenSave = KeychainTokenService.shared.saveToken(token: token, account: "username", service: service)
                    let nicknameSave = KeychainTokenService.shared.saveToken(token: nickname , account: "nickname", service: service)
                }
                
              
            }
        }
    }

}

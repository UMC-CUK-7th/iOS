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
                    
                    // 로그인 성공 시 동작 구현
                    _ = oauthToken
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
                    
                    // 로그인 성공 시 동작 구현
                    _ = oauthToken
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
}

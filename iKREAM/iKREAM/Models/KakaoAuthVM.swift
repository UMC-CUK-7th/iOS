//
//  KakaoAuthVM.swift
//  iKREAM
//
//  Created by 김윤진 on 11/13/24.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthVM: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    let loginSuccessPublisher = PassthroughSubject<(String, String), Never>() // 토큰과 닉네임 전달

    @Published var isLoggedIn: Bool = false
    lazy var loginStatusInfo: AnyPublisher<String?, Never> = $isLoggedIn
        .compactMap { $0 ? "로그인 상태" : "로그아웃 상태" }
        .eraseToAnyPublisher()
    
    func kakaoLoginWithApp() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk { [weak self] (oauthToken, error) in
                if let error = error {
                    print("Error logging in with KakaoTalk:", error)
                    continuation.resume(returning: false)
                } else {
                    print("loginWithKakaoTalk() success.")
                    if let token = oauthToken?.accessToken {
                        self?.fetchUserInfo(token: token)
                    }
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func kakaoLoginWithAccount() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount { [weak self] (oauthToken, error) in
                if let error = error {
                    print("Error logging in with KakaoAccount:", error)
                    continuation.resume(returning: false)
                } else {
                    print("loginWithKakaoAccount() success.")
                    if let token = oauthToken?.accessToken {
                        self?.fetchUserInfo(token: token)
                    }
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func handleKakaoLogin() {
        print("KakaoAuthVM - handleKakaoLogin() called")
        Task {
            if UserApi.isKakaoTalkLoginAvailable() {
                isLoggedIn = await kakaoLoginWithApp()
            } else {
                isLoggedIn = await kakaoLoginWithAccount()
            }
            
            // 로그인 성공 여부에 따라 처리
            if isLoggedIn {
                // 로그인 성공 시, 로그인 성공 이벤트를 전달
                loginSuccessPublisher.send(("로그인 성공", "사용자 닉네임"))
            }
        }
    }
    
    private func fetchUserInfo(token: String) {
        UserApi.shared.me { [weak self] user, error in
            if let error = error {
                print("Error fetching user info:", error)
            } else if let nickname = user?.kakaoAccount?.profile?.nickname {
                print("Fetched user info - Token: \(token), Nickname: \(nickname)")
                KeychainHelper.saveKakaoNickname(nickname) // 닉네임 저장
                self?.loginSuccessPublisher.send((token, nickname)) // 토큰과 닉네임 전달
            }
        }
    }
}

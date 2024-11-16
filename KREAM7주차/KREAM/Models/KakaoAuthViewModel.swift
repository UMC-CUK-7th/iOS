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
    
    init(){
        print("KakaoAuthViewModel-init() called")
    }
    func handleKakakoLogin(){
        print("KakaoAuthViewModel-handleKakakoLogin() called")
        
        //카카오톡 설치여부확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    // 성공 시 동작 구현
                    _ = oauthToken
                }
            }
        }
        else { //카카오톡 설치가 안되어있으면
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        // 성공 시 동작 구현
                        _ = oauthToken
                    }
                }
        }
    }
}

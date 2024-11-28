//
//  LoginViewController.swift
//  KREAM
//
//  Created by 류한비 on 10/7/24.
//

import UIKit
import SwiftUI
import Combine

class LoginViewController: UIViewController {
    
    private var subscriptions = Set<AnyCancellable>()
    let loginView = LoginView()
    
    // 로그인 모델 인스턴스 생성
    lazy var loginModel = LoginModel()
    
    // KakaoAuthViewModel 인스턴스 생성
    lazy var kakaoAuthViewModel: KakaoAuthViewModel = {
        KakaoAuthViewModel()
    }()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //로그인 버튼 액션 연결
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        // 카카오 로그인 버튼 액션 연결
        loginView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonDidTap), for: .touchUpInside)
        
        // 카카오 로그인 성공 시 화면 전환 설정
        kakaoLoginSuccess()
    }
    
    //MARK: - Login
    // 로그인 버튼 누르면 실행
    @objc
    private func loginButtonDidTap(){ //modal
        let mp = TapBarViewController()
        mp.modalPresentationStyle = .fullScreen
        present(mp, animated: true)
        
        guard let inputID = loginView.emailTextField.text, !inputID.isEmpty else {
            print("입력된 값이 없습니다.") //확인용
            return
        }
        guard let inputPWD = loginView.pwdTextField.text, !inputPWD.isEmpty else {
            print("입력된 값이 없습니다.")
            return
        }
        // 입력된 값을 UserDefaults에 저장
        loginModel.saveUserID(inputID)
        loginModel.saveUserPWD(inputPWD)
        
        // 저장 확인용
        print("저장 완료: \(inputID), \(inputPWD)")
    }
    
    //MARK: - KakaoLogin
    // 카카오톡 로그인 버튼 액션
    @objc
    func kakaoLoginButtonDidTap(){
        print("kakaoLoginButtonDidTap() called")
        kakaoAuthViewModel.handleKakaoLogin()
    }
    
    // 카카오 로그인 성공시 화면전환
    func kakaoLoginSuccess(){
        kakaoAuthViewModel.$isLogined.receive(on: DispatchQueue.main).sink { [weak self] isLogined in
            if isLogined {
                // 로그인 성공 시 TapBarViewController 모달로 띄우기
                let tapBarVC = TapBarViewController()
                tapBarVC.modalPresentationStyle = .fullScreen
                self?.present(tapBarVC, animated: true, completion: nil)
            }
        }
        .store(in: &subscriptions)
    }
}

#if DEBUG
struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        LoginViewController()
    }
}
#endif


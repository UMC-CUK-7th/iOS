//
//  LoginViewController.swift
//  KREAM
//
//  Created by 류한비 on 10/7/24.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //버튼 액션 연결
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    // 로그인 모델 인스턴스 생성
    lazy var loginModel = LoginModel()
    
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
}


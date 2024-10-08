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
    
    // 로그인 버튼 누르면 실행
    @objc
    private func loginButtonDidTap(){ //modal
        let mp = TapBarViewController()
        mp.modalPresentationStyle = .fullScreen
        present(mp, animated: true)
    }
}


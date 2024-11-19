//
//  ViewController.swift
//  KREAM
//
//  Created by 서재민 on 10/2/24.
//

import UIKit
import Combine
class LoginViewController: UIViewController {
    lazy var kakaoAuthViewModel: KakaoAuthViewModel = {KakaoAuthViewModel()}()
    var subscriptions = Set<AnyCancellable>()
    private let userDefaultsModel = UserDefaultsModel()
    let loginView = LoginView()
    var data : LoginModel = LoginModel(id:"", pwd: "")
    
    override func loadView () {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.LoginButton.addTarget(self, action: #selector(buttondidTap),for: .touchUpInside)
        self.loginView.KakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonDidTap), for: .touchUpInside)
        setBindings()
    }
    
    
    @objc
    private func buttondidTap(){
        let VC = TabBarController()
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true, completion: nil)
       
        guard let text = loginView.idTextField.text, !text.isEmpty else { return }
        userDefaultsModel.SaveUserEmail(text)
        guard let Pw = loginView.PWDTextField.text, !Pw.isEmpty else { return }
        userDefaultsModel.SaveUserPassword(Pw)
        
    }
   
    
    //MARK: - 카카오로그인
    
    @objc
    private func kakaoLoginButtonDidTap(){
        kakaoAuthViewModel.kakaoLogin()
    }
    
    
    fileprivate func setBindings(){
        self.kakaoAuthViewModel.$isLoggedIn.sink{ [weak self] isLoggedIn in
            guard let self = self else { return }
            if isLoggedIn == true {
                let tabBarVC = TabBarController()
                tabBarVC.modalPresentationStyle = .fullScreen
                self.present(tabBarVC, animated: true, completion: nil)
            }
        }
        .store(in: &subscriptions)
    }
}


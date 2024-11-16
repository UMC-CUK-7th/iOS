//
//  ViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 9/26/24.
//

import UIKit
import SnapKit
import Combine

class LoginViewController: UIViewController {
    // MARK: - Properties
    let loginView = LoginView()
    let kakaoAuthVM = KakaoAuthVM()
    private var cancellables = Set<AnyCancellable>()
    
    // 로그인 상태 라벨
    lazy var kakaoLoginStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인 여부 라벨"
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = loginView // viewController의 view를 loginView로 연동
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI() // UI 설정
        setButtonActions()
        setBindings()
    }
    
    // 화면의 빈곳을 터치한 경우에 키보드를 내리는 코드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Set Button Actions
    // 로그인 버튼과 카카오 로그인 버튼에 액션 추가
    private func setButtonActions() {
        self.loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        self.loginView.kakaoLoginButton.addTarget(self, action: #selector(didTapKakaoLoginButton), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc
    private func didTapLoginButton() {
        let rootTabBarVC = RootTabBarController()
        print(#function)
        rootTabBarVC.modalPresentationStyle = .fullScreen
        self.present(rootTabBarVC, animated: true, completion: nil) // present로 화면 전환
    }
    
    @objc
    private func didTapKakaoLoginButton() {
        kakaoAuthVM.handleKakaoLogin()
    }
    
}

// MARK: - 뷰모델 바인딩
extension LoginViewController {
    private func setBindings() {
        // 로그인 상태 라벨 업데이트 바인딩
        self.kakaoAuthVM.loginStatusInfo
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: self.kakaoLoginStatusLabel)
            .store(in: &self.cancellables)
        
        // 로그인 성공 시 토큰과 닉네임 키체인에 저장하고 탭바 전환
        kakaoAuthVM.loginSuccessPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] token, nickname in
                print("Login Success - Token: \(token), Nickname: \(nickname)")
                self?.saveToKeychain(token: token, nickname: nickname)
                self?.switchToTabBarController()  // 로그인 성공 시 탭바 전환
            }
            .store(in: &cancellables)
    }
    
    private func saveToKeychain(token: String, nickname: String) {
        KeychainHelper.save("accessToken", token)
        KeychainHelper.save("nickname", nickname)
        print("Token and nickname saved to Keychain.")
    }
    
    private func switchToTabBarController() {
        print("Switching to Tab Bar Controller")
        let tabBarController = RootTabBarController()  // RootTabBarController 인스턴스 생성
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    // UI 설정 (라벨을 화면에 추가)
    private func setupUI() {
        self.view.addSubview(kakaoLoginStatusLabel)
        
        // SnapKit을 사용해 레이아웃 설정
        kakaoLoginStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(loginView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}

#if DEBUG
import SwiftUI
import Combine

struct ViewControllerPresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = LoginViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        .init()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct ViewControllerPresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
    }
}
#endif

//
//  ManageProfileViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 10/7/24.
//

import UIKit

class ManageProfileViewController: UIViewController {
    // MARK: - Properties
    let manageProfileView = ManageProfileView()
    
    // 데이터를 받을 public 변수 선언
    public var receivedData: UIImage?
    

    // MARK: - Life Cycle
    override func loadView() {
        self.view = manageProfileView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setNavigationController()
        loadUserData() // UserDefaults에서 데이터 로드
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonActions()
        // 전달받은 데이터를 이미지 뷰에 표시
        if let data = receivedData {
            self.manageProfileView.profileImageView.image = data
        }
        
    }

    // 화면의 빈 곳을 터치한 경우에 키보드를 내리는 코드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // MARK: - Load User Data
    private func loadUserData() {
        // UserDefaults에서 이메일과 비밀번호를 로드
        let savedEmail = UserDefaults.standard.string(forKey: "userEmail") ?? ""
        let savedPassword = UserDefaults.standard.string(forKey: "userPassword") ?? ""
        manageProfileView.emailTextField.text = savedEmail
        manageProfileView.passwordTextField.text = savedPassword
    }

    // MARK: - Set Button Actions
    private func setButtonActions() {
        manageProfileView.emailUpdateButton.addTarget(self, action: #selector(didTapEmailUpdateButton), for: .touchUpInside)
        manageProfileView.passwordUpdateButton.addTarget(self, action: #selector(didTapPasswordUpdateButton), for: .touchUpInside)
    }

    // MARK: - Set NavigationController
    private func setNavigationController() {
        self.title = "프로필 관리"
        self.navigationController?.navigationBar.tintColor = .black
        let backButtonImage = UIImage(named: "BackImage")
        self.navigationController?.navigationBar.backIndicatorImage = backButtonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }

    // MARK: - Selectors
    
    @objc
    private func didTapEmailUpdateButton() {
        if !manageProfileView.emailTextField.isEnabled {
            manageProfileView.emailUpdateButton.setTitle("확인", for: .normal)
            manageProfileView.emailTextField.isEnabled = true
            manageProfileView.emailTextField.becomeFirstResponder()
        } else {
            // "확인" 버튼 클릭 시 이메일 저장
            let updatedEmail = manageProfileView.emailTextField.text ?? ""
            UserDefaults.standard.set(updatedEmail, forKey: "userEmail")

            manageProfileView.emailUpdateButton.setTitle("변경", for: .normal)
            manageProfileView.emailTextField.isEnabled = false
    
        }
    }

    @objc
    private func didTapPasswordUpdateButton() {
        if !manageProfileView.passwordTextField.isEnabled {
            manageProfileView.passwordUpdateButton.setTitle("확인", for: .normal)
            manageProfileView.passwordTextField.isEnabled = true
            manageProfileView.passwordTextField.isSecureTextEntry = false
            manageProfileView.passwordTextField.becomeFirstResponder()
        } else {
            // "확인" 버튼 클릭 시 비밀번호 저장
            let updatedPassword = manageProfileView.passwordTextField.text ?? ""
            UserDefaults.standard.set(updatedPassword, forKey: "userPassword")

            manageProfileView.passwordUpdateButton.setTitle("변경", for: .normal)
            manageProfileView.passwordTextField.isEnabled = false
            manageProfileView.passwordTextField.isSecureTextEntry = true
        }
    }
}

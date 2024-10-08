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
    
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = manageProfileView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationController() // viewDidLoad에 적는것도 가능하긴 하다!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonActions()
    }
    
    // 화면의 빈곳을 터치한 경우에 키보드를 내리는 코드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Set Button Actions
    private func setButtonActions() {
        // 버튼 action관리
        manageProfileView.emailUpdateButton.addTarget(self, action: #selector(didTapEmailUpdateButton), for: .touchUpInside)
        manageProfileView.passwordUpdateButton.addTarget(self, action: #selector(didTapPasswordUpdateButton), for: .touchUpInside)
        
    }
    
    // MARK: - Set NavigationController
    private func setNavigationController() {
        self.title = "프로필 관리"
        self.navigationController?.navigationBar.tintColor = .black
        let backButtonImage = UIImage(named: "BackImage") //뒤로 가기
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
            manageProfileView.emailTextField.becomeFirstResponder() // 이메일 textField 자동 선택
             
        } else {
            manageProfileView.emailUpdateButton.setTitle("변경", for: .normal)
            manageProfileView.emailTextField.isEnabled = false
        }
    }
    
    // 비밀번호 변경 버튼 눌리면 실행할 함수
    @objc
    private func didTapPasswordUpdateButton() {
        // (실제로 이렇게 개발하진 않는다는 코멘트)
        if !manageProfileView.passwordTextField.isEnabled {
            manageProfileView.passwordUpdateButton.setTitle("확인", for: .normal)
            manageProfileView.passwordTextField.isEnabled = true
            manageProfileView.passwordTextField.isSecureTextEntry = false
            manageProfileView.passwordTextField.becomeFirstResponder() // 비밀번호 textField 자동 선택
            
        } else {
            manageProfileView.passwordUpdateButton.setTitle("변경", for: .normal)
            manageProfileView.passwordTextField.isEnabled = false
            manageProfileView.passwordTextField.isSecureTextEntry = true
            
        }
    }
}

//
//  ManageProfileViewController.swift
//  KreamCloneCoding
//
//  Created by 김승원 on 9/28/24.
//

// 워크북 2주차

import UIKit

class ManageProfileViewController: UIViewController {
    // MARK: - Properties
    let manageProfileView = ManageProfileView()
    
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = manageProfileView
    }
    
    // 보통 navigation바 관련 코드는 viewWillAppear에서 작성 & viewDidLoad도 가능!
    // 이 viewWillAppear함수가 뭔지 모르겠다면 1주차 워크북 개념 다시 보기!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationController()
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
        self.navigationController?.navigationBar.isHidden = false
        
        /*
         네비바 커스텀은 스스로 구글링 하여 공부하는 것을 추천드립니다.
         */
        let backButtonImage = UIImage(systemName: "arrow.left")
        self.navigationController?.navigationBar.backIndicatorImage = backButtonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    
    // MARK: - Selectors
    // 이메일 변경 버튼 눌리면 실행할 함수
    @objc
    private func didTapEmailUpdateButton() {
        // textField가 비활성화된 상태면 버튼을 "확인"으로 바꾸고, textField 활성화
        // 반대로 활성화된 상태면 버튼을 다시 "변경"으로 바꾸고 textField 비활성화
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
        // 위에 email로직과 똑같음 + 비밀번호 보이게
        // 실제로 이렇게 개발하진 않습니다..!
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

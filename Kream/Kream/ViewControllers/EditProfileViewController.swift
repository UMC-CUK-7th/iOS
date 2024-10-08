//
//  EditProfileViewController.swift
//  KREAM
//
//  Created by 류한비 on 9/30/24.
//

import UIKit

class EditProfileViewController: UIViewController {
    let editProfileView = EditProfileView()
    
    override func loadView() {
        self.view = editProfileView
    }
    
    // navigation바
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //텍스트 필드 비활성화(변경 버튼 누르기 전)
        editProfileView.emailTextField.isEnabled = false
        editProfileView.pwTextField.isEnabled = false
        
        //버튼 액션 연결
        editProfileView.emailButton.addTarget(self, action: #selector(pEmailButton), for: .touchUpInside)
        editProfileView.pwButton.addTarget(self, action: #selector(pPwButtom), for: .touchUpInside)
    }
    
    // navigation바 설정
    private func setNavigationBar() {
        // 타이틀
        self.title = "프로필 관리"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.isHidden = false
        
        // backButton
        let backButton = UIImage(systemName: "arrow.left") //뒤로가기 버튼 이미지
        self.navigationController?.navigationBar.backIndicatorImage = backButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "" //버튼 타이틀 없음
    }
    
    //버튼 누르면 실행
    @objc
    private func pEmailButton() { //이메일
        if !editProfileView.emailTextField.isEnabled {
            editProfileView.emailButton.setTitle("확인", for: .normal)
            editProfileView.emailTextField.isEnabled = true //텍스트 필드 활성화
            
        }else {
            editProfileView.emailButton.setTitle("변경", for: .normal)
            editProfileView.emailTextField.isEnabled = false //텍스트 필드 비활성화 (입력불가능)
        }
    }
    
    @objc
    private func pPwButtom() { //비밀번호
        if !editProfileView.pwTextField.isEnabled {
            editProfileView.pwButton.setTitle("확인", for: .normal)
            editProfileView.pwTextField.isEnabled = true //텍스트 필드 활성화
            editProfileView.pwTextField.isSecureTextEntry = false
            
        }else {
            editProfileView.pwButton.setTitle("변경", for: .normal)
            editProfileView.pwTextField.isEnabled = false //텍스트 필드 비활성화 (입력불가능)
            editProfileView.pwTextField.isSecureTextEntry = true
            
        }
        
    }
}



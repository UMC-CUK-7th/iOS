//
//  EditProfileViewController.swift
//  KREAM
//
//  Created by 류한비 on 9/30/24.
//

import UIKit

class EditProfileViewController: UIViewController {
    // 프로필 이미지 전달 받을 변수
    var profileImage: UIImage?
    
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
        setImage()
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
    
    // 프로필 이미지 뷰로 전달
    private func setImage(){
        editProfileView.profileImage.image = profileImage
    }
    
    // MARK: - @objc
    
    // 로그인 모델 인스턴스 생성
    lazy var loginModel = LoginModel()
    
    @objc //버튼 누르면 실행
    private func pEmailButton() { //이메일
        if !editProfileView.emailTextField.isEnabled {
            //이메일을 입력 가능하게 변경
            editProfileView.emailButton.setTitle("확인", for: .normal)
            editProfileView.emailTextField.isEnabled = true //텍스트 필드 활성화
            editProfileView.emailTextField.placeholder = "새로운 이메일을 입력해 주세요!"
            editProfileView.emailTextField.attributedPlaceholder = NSAttributedString(
                string: "새로운 이메일을 입력해 주세요!",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        }else {
            //확인 버튼을 눌렸을 때
            //유저가 새롭게 입력한 텍스트를 저장
            if let newEmail = editProfileView.emailTextField.text, !newEmail.isEmpty {
                loginModel.saveUserID(newEmail)
            } else {
                print("이메일이 입력되지 않았습니다.") //확인용
            }
            
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
            editProfileView.pwTextField.attributedPlaceholder = NSAttributedString(
                string: "새로운 비밀번호를 입력해 주세요!",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        }else {
            //확인 버튼을 눌렸을 때
            //유저가 새롭게 입력한 텍스트를 저장
            if let newPasswd = editProfileView.pwTextField.text, !newPasswd.isEmpty {
                loginModel.saveUserPWD(newPasswd)
            } else {
                print("비밀번호 입력되지 않았습니다.") //확인용
            }
            editProfileView.pwButton.setTitle("변경", for: .normal)
            editProfileView.pwTextField.isEnabled = false //텍스트 필드 비활성화 (입력불가능)
            editProfileView.pwTextField.isSecureTextEntry = true
            
        }
        
    }
}



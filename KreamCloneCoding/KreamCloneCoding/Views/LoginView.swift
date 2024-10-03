//
//  LoginView.swift
//  KreamCloneCoding
//
//  Created by 김승원 on 9/25/24.
//

// 워크북 1주차

import UIKit

class LoginView: UIView {
    // MARK: - UI Components
    // 로고 이미지
    let logoImageView: UIImageView = {
        let iv = UIImageView() // UIImageView는 안에 UIImage를 담을 수 있는 View
        iv.image = UIImage(named: "logoImage")
        iv.contentMode = .scaleAspectFit // 화면을 어떤 방식으로 채울 건지 (추가 설명은 구글링)
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // 이메일 주소 label
    let emailLabel: UILabel = {
        let lb = UILabel()
        lb.text = "이메일 주소"
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .black
        lb.numberOfLines = 1
        lb.textAlignment = .left
        
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    // 이메일 textField
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "예) kream@kream.co.kr" // 플레이스홀더 (사용자가 textField에 타이핑을 하기 전 나타나는 문구)
        tf.font = .systemFont(ofSize: 12, weight: .regular)
        
        tf.layer.cornerRadius = 15 // 코너 둥글게
        tf.layer.borderWidth = 1 // 외각선
        tf.layer.borderColor = UIColor.lightGray.cgColor // 외각선 색상
        tf.layer.masksToBounds = true // 서브레이어나 콘텐츠가 레이어의 경계를 넘는 경우, 그 부분을 자를 건지 여부
        
        // textField에 왼쪽 공백을 주는 법
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        tf.leftView = leftView
        tf.leftViewMode = .always
        
        tf.autocapitalizationType = .none // 첫 글자 자동 대문자 끔
        tf.autocorrectionType = .no // 추천 글자 표시 끔
        tf.spellCheckingType = .no // 오류(오타)난 글자 표시 끔
        tf.keyboardType = .emailAddress // 키보드 타입을 이메일로 바꾸는 코드 (여러가지 애플이 만들어 놓은 키보드 모드가 있음, 필수는 아님)
        tf.returnKeyType = .done // return버튼 타입
        tf.clearsOnBeginEditing = false // textField편집시 기존 textField값 제거 끔 (기본이 false)
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // 비밀번호 label
    let passwordLabel: UILabel = {
        let lb = UILabel()
        lb.text = "비밀번호"
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .black
        lb.numberOfLines = 1
        lb.textAlignment = .left
        
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    // 비밀번호 textField
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "비밀번호를 입력해주세요"
        tf.font = .systemFont(ofSize: 12, weight: .regular)
        tf.isSecureTextEntry = true // 입력되는 글자가 안 보임 (*처리)
        tf.layer.cornerRadius = 15
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.masksToBounds = true
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        tf.leftView = leftView
        tf.leftViewMode = .always
        
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // 로그인 버튼
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .lightGray
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // 소셜 버튼
    let socialButtons: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "socialButtonsImage")
        iv.contentMode = .scaleToFill
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    

    // MARK: - init (생성자)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI (하위 뷰에 UI Components 추가)
    private func setupUI() {
        self.backgroundColor = .white
        
        self.addSubview(logoImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(socialButtons)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints (제약조건 / AutoLayout)
    private func setupConstraints() {
        
        // logo ImageView
        logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -53).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        // email Label
        emailLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 70).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // email TextField
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        // password Label
        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // password TextField
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        // login Button
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 17).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        // social Buttons
        socialButtons.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87).isActive = true
        socialButtons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        socialButtons.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
        socialButtons.heightAnchor.constraint(equalToConstant: 102).isActive = true
    }
    
}

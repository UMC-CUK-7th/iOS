//
//  LoginView.swift
//  iKREAM
//
//  Created by 김윤진 on 9/26/24.
//

import UIKit

class LoginView: UIView {
    
    let logoImageView: UIImageView = {
        let loginImageView = UIImageView() //UIImage 담을 view
        loginImageView.image = UIImage(named: "LogoImage")
        loginImageView.contentMode = .scaleAspectFit //화면 채우는 방식 코드
        loginImageView.translatesAutoresizingMaskIntoConstraints = false //제약을 걸어주는 용도
        return loginImageView
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont(name: "Inter", size: 12)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예) KREAM@KREAM.CO.KR" // 플레이스홀더 : 문구를 입력하기전에 보여주는 문구
        textField.font = .systemFont(ofSize: 12, weight: .regular)
        textField.layer.cornerRadius = 15 // 둥글게
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true // 콘텐츠가 레이어의 경게를 넘으면, 그 부분을 자를건지 묻는 여부 코드 (참)
        
        let leftview = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16)) // 왼쪽에 공백 주는 코드
        textField.leftView = leftview
        textField.leftViewMode = .always
        
        textField.autocapitalizationType = .none // 첫 글자 대문자 (자동) 끄는 코드
        textField.autocorrectionType = .no // 추천글자 표시 끄는 코드
        textField.spellCheckingType = .no // 오타글자 표시 끄는 코드
        textField.keyboardType = .emailAddress // 키보드 타입을 이메일로 바꾸는 코드이지만, 필수는 아니다!
        textField.returnKeyType = .done
        textField.clearsOnBeginEditing = false // 텍스트 필드 편집 시, 기존 값 제거 ( 기본이 false )
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont(name: "Inter", size: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " 비밀번호를 입력해주세요"
        textField.font = .systemFont(ofSize: 12, weight: .regular)
        textField.isSecureTextEntry = true // 비밀번호 입력처리 (글자 안보이게)
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        let leftview = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16)) // 왼쪽에 공백 주는 코드
        textField.leftView = leftview
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카카오 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let kakaoLogoImageView: UIImageView = { // 카카오 로고 이미지
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KakaoImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apple로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let appleLogoImageView: UIImageView = { // 애플 로고 이미지
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppleImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    /*let KakaoButton: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "KakaoImage")
        iv.contentMode = .scaleToFill
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let AppleButton: UIImageView = {
        let iiv = UIImageView()
        iiv.image = UIImage(named: "AppleImage")
        iiv.contentMode = .scaleToFill
        
        iiv.translatesAutoresizingMaskIntoConstraints = false
        return iiv
    }()*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubview(logoImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        self.addSubview(kakaoLogoImageView)
        self.addSubview(appleLogoImageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        //autolayout 제약
        // logo ImageView
        logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 126).isActive = true
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
        
        // social Buttons  - 카카오&애플
        kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87).isActive = true
        kakaoLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47).isActive = true
        kakaoLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47).isActive = true
        kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 22).isActive = true
        appleLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47).isActive = true
        appleLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47).isActive = true
        appleLoginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // 카카오 로고 이미지 설정
        kakaoLogoImageView.topAnchor.constraint(equalTo: kakaoLoginButton.topAnchor, constant: 13).isActive = true 
        kakaoLogoImageView.leadingAnchor.constraint(equalTo: kakaoLoginButton.leadingAnchor, constant: 17).isActive = true
        kakaoLogoImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        kakaoLogoImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true

        // 애플 로고 이미지 설정
        appleLogoImageView.topAnchor.constraint(equalTo: appleLoginButton.topAnchor, constant: 11).isActive = true
        appleLogoImageView.leadingAnchor.constraint(equalTo: appleLoginButton.leadingAnchor, constant: 17).isActive = true
        appleLogoImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        appleLogoImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
}

//
//  LoginView.swift
//  KREAM
//
//  Created by 류한비 on 10/7/24.
//

import UIKit

class LoginView: UIView {
    
    // 로고 이미지
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoImage")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 이메일 label
    let emailLabel: UILabel = {
        let lb = UILabel()
        lb.text = "이메일 주소"
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .black
        lb.textAlignment = .left
        
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    // 이메일 textField
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "예) kream@kream.co.kr"
        tf.font = .systemFont(ofSize: 12, weight: .regular)
        tf.layer.cornerRadius = 15
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.masksToBounds = true
        //텍스트 필드 왼쪽 공백 (참고)
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        tf.leftViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    //비밀번호 label
    let pwdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "비밀번호"
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .black
        lb.textAlignment = .left
        
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        return lb
    }()
    
    //비밀번호 textField
    lazy var pwdTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "비밀번호를 입력해주세요."
        tf.font = .systemFont(ofSize: 12, weight: .regular)
        tf.layer.cornerRadius = 15
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.masksToBounds = true
        
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        tf.leftViewMode = .always
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    //로그인 button
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
    
    //카카오 로그인 버튼
    lazy var kakaoLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("카카오로 로그인", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.masksToBounds = true
        
        // 카카오 로고 이미지 추가
        let kakaoImage = UIImage(systemName: "message.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        btn.setImage(kakaoImage, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .center
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //애플 로그인 버튼
    lazy var appleLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Apple로 로그인", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.masksToBounds = true
        
        // 애플 로고 이미지 추가
        let appleImage = UIImage(systemName: "apple.logo")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        btn.setImage(appleImage, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: 0)
        btn.contentHorizontalAlignment = .center
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI setup
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubview(logoImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(pwdLabel)
        self.addSubview(pwdTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        // 로고 이미지
        logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 287).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        // 이메일 label
        emailLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 70).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 45).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // 이메일 textField
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        //비밀번호 label
        pwdLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17).isActive = true
        pwdLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        pwdLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 45).isActive = true
        pwdLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        //비밀번호 textField
        pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor, constant: 8).isActive = true
        pwdTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        pwdTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
        pwdTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        //로그인 button
        loginButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 17).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        //카카오 로그인 버튼
        kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87).isActive = true
        kakaoLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5).isActive = true
        kakaoLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47.5).isActive = true
        kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //애플 로그인 버튼
        appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 22).isActive = true
        appleLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5).isActive = true
        appleLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47.5).isActive = true
        appleLoginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    
}

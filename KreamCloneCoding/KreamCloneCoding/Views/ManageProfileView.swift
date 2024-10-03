//
//  ManageProfileView.swift
//  KreamCloneCoding
//
//  Created by 김승원 on 9/28/24.
//

// 워크북 2주차
// then라이브러리 저도 처음 사용해봅니다.

import UIKit
import SnapKit
import Then

class ManageProfileView: UIView {
    // MARK: - UI Components
    let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "profileImage")
        $0.contentMode = .scaleAspectFill
        $0.layer.borderWidth = 1
    }
    
    // 프로필 정보 label
    let profileInfoLabel = UILabel().then {
        $0.text = "프로필 정보"
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textColor = .black
    }
    
    // 유저 이메일 label
    let emailLabel = UILabel().then {
        $0.text = "유저 이메일"
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .black
    }
    
    // 유저 이메일 textField
    lazy var emailTextField = UITextField().then {
        $0.text = "iOSZZang@naver.com"
        $0.placeholder = "새로운 이메일을 입력해주세요!"
        $0.isEnabled = false
        $0.keyboardType = .emailAddress
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.masksToBounds = true
        
        // 왼쪽 공백 view
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 11))
        $0.leftView = leftView
        $0.leftViewMode = .always
    }
    
    // 유저 이메일 변경 버튼
    lazy var emailUpdateButton = UIButton().then {
        $0.setTitle("변경", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 6
        $0.layer.masksToBounds = true
    }
    
    // 유저 이메일 textfield + Button StackView
    lazy var emailStackView = UIStackView().then {
        $0.addArrangedSubview(emailTextField)
        $0.addArrangedSubview(emailUpdateButton)
        $0.axis = .horizontal
        $0.spacing = 9
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    // 유저 비밀번호 label
    let passwordLabel = UILabel().then {
        $0.text = "유저 비밀번호"
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .black
    }
    
    // 유저 이메일 textField
    lazy var passwordTextField = UITextField().then {
        $0.text = "abcdefghi1234"
        $0.placeholder = "새로운 비밀번호를 입력해주세요!"
        $0.isEnabled = false
        $0.keyboardType = .default
        $0.isSecureTextEntry = true // 비밀번호 textField시 필수
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.masksToBounds = true
        
        // 왼쪽 공백 view
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 11))
        $0.leftView = leftView
        $0.leftViewMode = .always
    }
    
    // 유저 이메일 변경 버튼
    lazy var passwordUpdateButton = UIButton().then {
        $0.setTitle("변경", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 6
        $0.layer.masksToBounds = true
    }
    
    // 유저 이메일 textfield + Button StackView
    lazy var passwordStackView = UIStackView().then {
        $0.addArrangedSubview(passwordTextField)
        $0.addArrangedSubview(passwordUpdateButton)
        $0.axis = .horizontal
        $0.spacing = 9
        $0.alignment = .fill
        $0.distribution = .fill
    }
    

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.backgroundColor = .white
        
        self.addSubview(profileImageView)
        self.addSubview(profileInfoLabel)
        self.addSubview(emailLabel)
        self.addSubview(emailStackView)
        self.addSubview(passwordLabel)
        self.addSubview(passwordStackView)
        
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.layer.masksToBounds = true
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(52)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(90)
        }
        
        profileInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(29)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(22)
        }
        
        emailUpdateButton.snp.makeConstraints { make in
            make.width.equalTo(58)
        }
        
        emailStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(22)
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.height.equalTo(32)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailStackView.snp.bottom).offset(23)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(22)
        }
        
        passwordUpdateButton.snp.makeConstraints { make in
            make.width.equalTo(58)
        }
        
        passwordStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(22)
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.height.equalTo(32)
        }
        
    }
}

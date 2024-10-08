//
//  ManageProfileView.swift
//  iKREAM
//
//  Created by 김윤진 on 10/7/24.
//

import UIKit
import SnapKit

class ManageProfileView: UIView {
    // MARK: - UI Components
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    let profileInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    // 유저 이메일 textField
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.text = "EXAMPLE@naver.com"
        textField.placeholder = "새로운 이메일을 입력해주세요!"
        textField.isEnabled = false
        textField.keyboardType = .emailAddress
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        
        // 왼쪽 공백 view
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 11))
        textField.leftView = leftView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var emailUpdateButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        return button
    }()
    
    // 유저 이메일 textfield + Button StackView
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, emailUpdateButton])
        stackView.axis = .horizontal
        stackView.spacing = 9
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    // 유저 비밀번호 textField
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = "example1234"
        textField.placeholder = "새로운 비밀번호를 입력해주세요!"
        textField.isEnabled = false
        textField.keyboardType = .default
        textField.isSecureTextEntry = true // 비밀번호 textField시 필수
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        
        // 왼쪽 공백 view
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 11))
        textField.leftView = leftView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var passwordUpdateButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        return button
    }()
    
    // 유저 비밀번호 textfield + Button StackView
    lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordTextField, passwordUpdateButton])
        stackView.axis = .horizontal
        stackView.spacing = 9
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
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

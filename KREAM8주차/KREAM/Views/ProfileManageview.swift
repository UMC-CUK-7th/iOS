//
//  ProfileManageview.swift
//  KREAM
//
//  Created by 서재민 on 10/8/24.
//

import Foundation
import UIKit
import SnapKit

class ProfileManageview: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addcomponents()
    }
    
    private func addcomponents() {
        
        self.addSubview(profileManageImage)
        self.addSubview(ProfileInfoLabel)
        self.addSubview(UserEmailLabel)
        self.addSubview(UserEmailTextField)
        self.addSubview(ChangeEmailButton)
        self.addSubview(ChangePasswordLabel)
        self.addSubview(ChangePasswordTextField)
        self.addSubview(ChangePasswordButton)
       
        
        //제약조건
        self.profileManageImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(94)
            make.leading.equalToSuperview().inset(151)
            make.trailing.equalToSuperview().inset(152)
            make.height.equalTo(90)
            
        }
        

        
        self.ProfileInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(profileManageImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(27)
            make.trailing.equalToSuperview().inset(17)
            make.height.equalTo(29)
        }
        self.UserEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(ProfileInfoLabel.snp.bottom).offset(23)
            make.leading.equalToSuperview().inset(27)
            make.trailing.equalToSuperview().inset(17)
            make.height.equalTo(22)
        }
        self.UserEmailTextField.snp.makeConstraints { make in
            make.top.equalTo(UserEmailLabel.snp.bottom).offset(0)
            make.leading.equalToSuperview().inset(27)
            make.trailing.equalToSuperview().inset(84)
            make.height.equalTo(32)
        }
        self.ChangeEmailButton.snp.makeConstraints { make in
            make.top.equalTo(UserEmailLabel.snp.bottom).offset(0)
            make.leading.equalTo(UserEmailTextField.snp.trailing).offset(9)
            make.trailing.equalToSuperview().inset(17)
            make.height.equalTo(32)
        }
        
        self.ChangePasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(UserEmailTextField.snp.bottom).offset(23)
            make.leading.equalToSuperview().inset(27)
            make.trailing.equalToSuperview().inset(17)
            make.height.equalTo(22)
            
        }
        self.ChangePasswordTextField.snp.makeConstraints{make in
            make.top.equalTo(ChangePasswordLabel.snp.bottom).offset(0)
            make.leading.equalToSuperview().inset(27)
            make.trailing.equalToSuperview().inset(84)
            make.height.equalTo(32)
        }
        self.ChangePasswordButton.snp.makeConstraints{make in
            make.top.equalTo(ChangePasswordLabel.snp.bottom).offset(0)
            make.leading.equalTo(ChangePasswordTextField.snp.trailing).offset(9)
            make.trailing.equalToSuperview().inset(17)
        
            make.height.equalTo(32)
        }
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    public let profileManageImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Shoe.png")
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let ProfileInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = .systemFont(ofSize:18 , weight: .regular)
        label.textColor = .black
        return label
    }()
    
    let UserEmailLabel : UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = .systemFont(ofSize:14 , weight: .regular)
        label.textColor = .black
        return label
    }()
    
        lazy var UserEmailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "새로운 이메일을 입력해주세요!"
        textField.font = .systemFont(ofSize:14 , weight: .regular)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 11))
        textField.textColor = .black
            textField.attributedText = NSAttributedString(string: "jemin1206@naver.com", attributes: [.foregroundColor: UIColor.black])
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        
        return textField
    }()
    
     lazy var ChangeEmailButton : UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
    let ChangePasswordLabel : UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = .systemFont(ofSize:14 , weight: .regular)
        label.textColor = .black
        return label
    }()
    
     lazy var ChangePasswordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "새로운 비밀번호를 입력해주세요!"
         textField.attributedText = NSAttributedString(string: "12345679", attributes: [.foregroundColor: UIColor.black])
        textField.font = .systemFont(ofSize:14 , weight: .regular)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 11))
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        return textField
    }()
    
  lazy var ChangePasswordButton : UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
    
}

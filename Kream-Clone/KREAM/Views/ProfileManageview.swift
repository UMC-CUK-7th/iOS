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
        self.addSubview(ProfileManageLabel)
        self.addSubview(profileManageImage)
        self.addSubview(ProfileInfoLabel)
        self.addSubview(UserEmailLabel)
        self.addSubview(UserEmailTextField)
        self.addSubview(ChangeEmailButton)
        self.addSubview(ChangePasswordLabel)
        self.addSubview(ChangePasswordTextField)
        self.addSubview(ChangePasswordButton)
        
        //제약조건
        self.ProfileManageLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.equalToSuperview().inset(164)	
        }
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let ProfileManageLabel : UILabel = {
        let label = UILabel()
        label.text = "프로필 관리"
        label.font = .systemFont(ofSize:16 , weight: .regular)
        label.textColor = .black
        return label
    }()
    
    
    
    public lazy var profileManageImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_manage")
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
    
    private lazy var UserEmailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "새로운 이메일을 입력해주세요!"
        textField.font = .systemFont(ofSize:14 , weight: .regular)
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var ChangeEmailButton : UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
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
    
    private lazy var ChangePasswordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "새로운 비밀번호를 입력해주세요!"
        textField.font = .systemFont(ofSize:14 , weight: .regular)
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private lazy var ChangePasswordButton : UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.masksToBounds = true
        return button
    }()
    
    
}

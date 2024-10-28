//
//  EditProfileView.swift
//  KREAM
//
//  Created by 류한비 on 10/6/24.
//


import UIKit
import SnapKit

class EditProfileView: UIView {
    // 로그인 모델 인스턴스 생성
    let loginModel = LoginModel()
    
    // 프로필 사진
    let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "image 10.png")
        iv.contentMode = .scaleAspectFill // 이미지 비율 유지
        iv.clipsToBounds = true
        return iv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }
    
    // 프로필 정보 Label
    let infoProfileLabel: UILabel = {
        let info = UILabel()
        info.text = "프로필 정보"
        info.textColor = .black
        info.textAlignment = .left
        info.font = .systemFont(ofSize: 18, weight: .regular)
        return info
    }()
    
    // 유저 이메일 Label
    let userEmailLabel: UILabel = {
        let ue = UILabel()
        ue.text = "유저 이메일"
        ue.textColor = .black
        ue.textAlignment = .left
        ue.font = .systemFont(ofSize: 14, weight: .regular)
        return ue
    }()
    
    // 유저 이메일 TextField
    lazy var emailTextField: UITextField = {
        let et = UITextField()
        let userID = loginModel.loadUserID() ?? "이메일" // 기본 값 설정
        
        et.attributedPlaceholder = NSAttributedString(string: userID, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        et.font = .systemFont(ofSize: 14, weight: .regular)
        et.layer.cornerRadius = 10
        et.layer.borderWidth = 1
        et.layer.borderColor = UIColor.lightGray.cgColor
        et.layer.masksToBounds = true
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 11))
        et.leftView = leftView
        et.leftViewMode = .always
        return et
    }()
    
    // 유저 비밀번호 Label
    let userPwLabel: UILabel = {
        let up = UILabel()
        up.text = "유저 비밀번호"
        up.textColor = .black
        up.textAlignment = .left
        up.font = .systemFont(ofSize: 14, weight: .regular)
        return up
    }()
    
    // 유저 비밀번호 TextField
    lazy var pwTextField: UITextField = {
        let pt = UITextField()
        let userPWD = loginModel.loadUserPWD() ?? "비밀번호" // 기본 값 설정
        pt.text = userPWD // 데이터 저장
        pt.font = .systemFont(ofSize: 14, weight: .regular)
        pt.layer.cornerRadius = 10
        pt.layer.borderWidth = 1
        pt.layer.borderColor = UIColor.lightGray.cgColor
        pt.layer.masksToBounds = true
        pt.isSecureTextEntry = true
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 11))
        pt.leftView = leftView
        pt.leftViewMode = .always
        return pt
    }()
    
    // 변경 Button
    lazy var emailButton : UIButton = {
        let eb = UIButton()
        eb.setTitle("변경", for: .normal)
        eb.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        eb.setTitleColor(.black, for: .normal)
        eb.backgroundColor = .white
        eb.layer.borderColor = UIColor.black.cgColor
        eb.layer.cornerRadius = 6
        eb.layer.borderWidth = 1
        eb.layer.masksToBounds = true
        return eb
    }()
    
    lazy var pwButton : UIButton = {
        let eb = UIButton()
        eb.setTitle("변경", for: .normal)
        eb.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        eb.setTitleColor(.black, for: .normal)
        eb.backgroundColor = .white
        eb.layer.borderColor = UIColor.black.cgColor
        eb.layer.cornerRadius = 6
        eb.layer.borderWidth = 1
        eb.layer.masksToBounds = true
        return eb
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -UI setup
    private func setupUI(){
        self.backgroundColor = .white
        
        // 프로필 사진
        self.addSubview(profileImage)
        profileImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(144)
            $0.leading.equalToSuperview().offset(151)
            $0.height.width.equalTo(90)
        }
        
        // 프로필 정보 Label
        self.addSubview(infoProfileLabel)
        infoProfileLabel.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(27)
            $0.height.equalTo(29)
        }
        
        // 유저 이메일 Label
        self.addSubview(userEmailLabel)
        userEmailLabel.snp.makeConstraints{
            $0.top.equalTo(infoProfileLabel.snp.bottom).offset(23)
            $0.leading.equalTo(infoProfileLabel)
            $0.height.equalTo(22)
        }
        
        // 유저 비밀번호 Label
        self.addSubview(userPwLabel)
        userPwLabel.snp.makeConstraints{
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(59)
            $0.leading.equalTo(infoProfileLabel)
            $0.height.equalTo(22)
        }
        
        // 유저 이메일 TextField
        self.addSubview(emailTextField)
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.leading.equalTo(infoProfileLabel)
            $0.trailing.equalToSuperview().inset(84)
            $0.height.equalTo(32)
            $0.width.equalTo(282)
        }
        
        // 유저 비밀번호 TextField
        self.addSubview(pwTextField)
        pwTextField.snp.makeConstraints{
            $0.top.equalTo(userPwLabel.snp.bottom).offset(4)
            $0.leading.equalTo(infoProfileLabel)
            $0.trailing.equalToSuperview().inset(84)
            $0.height.equalTo(32)
            $0.width.equalTo(282)
        }
        
        // 이메일 변경 Button
        self.addSubview(emailButton)
        emailButton.snp.makeConstraints{
            $0.top.equalTo(emailTextField)
            $0.leading.equalTo(emailTextField.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(32)
            $0.width.equalTo(58)
        }
        
        // 비밀번호 변경 Button
        self.addSubview(pwButton)
        pwButton.snp.makeConstraints{
            $0.top.equalTo(pwTextField)
            $0.leading.equalTo(emailTextField.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(32)
            $0.width.equalTo(58)
        }
    }
}


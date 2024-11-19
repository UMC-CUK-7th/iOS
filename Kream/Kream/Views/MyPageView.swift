//
//  MyPageView.swift
//  KREAM
//
//  Created by 류한비 on 10/6/24.
//

import UIKit
import SnapKit

class MyPageView: UIView {
    // 프로필 사진
    let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "SesameImage")
        iv.contentMode = .scaleAspectFill // 이미지 비율 유지
        iv.clipsToBounds = true
        return iv
    }()
    
    override func layoutSubviews() { //레이아웃이 적용된 후에 호출되어 뷰 크기를 기반으로 동적 설정 가능
        super.layoutSubviews()
        // 이미지 뷰의 높이나 너비의 절반을 cornerRadius로 설정하여 원형으로 만들기
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }
    
    // 프로필 이름
    lazy var userName: UITextField = {
        let user = UITextField()
        
        // Keychain에서 불러온 닉네임을 placeholder로 설정
        let service = Bundle.main.bundleIdentifier ?? "KakaoLoginService" 
        let nickname = KeychainService.shared.load(account: "userNickname", service: service) // Keychain에서 저장된 닉네임을 불러옴
        user.attributedPlaceholder = NSAttributedString(string: nickname ?? "Sesame_iOS", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]) //Placeholder색 변경
        user.font = .systemFont(ofSize: 16, weight: .regular)
        return user
    }()
    
    // 팔로워
    let userFollower : UILabel = {
        let ufr = UILabel()
        ufr.text = "팔로워 326"
        ufr.textColor = .black
        ufr.textAlignment = .left
        ufr.font = .systemFont(ofSize: 12, weight: .regular)
        return ufr
    }()
    
    // 팔로잉
    let userFollowing : UILabel = {
        let ufg = UILabel()
        ufg.text = "팔로잉 20"
        ufg.textColor = .black
        ufg.textAlignment = .left
        ufg.font = .systemFont(ofSize: 12, weight: .regular)
        return ufg
    }()
    
    // 설정버튼
    lazy var setupButton : UIButton = {
        let su = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "gearshape")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        su.configuration = configuration
        return su
    }()
    
    // 카메라버튼
    lazy var cameraButton : UIButton = {
        let cr = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "camera")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        cr.configuration = configuration
        return cr
    }()
    
    // 프로필 관리 버튼
    lazy var editProfileButton : UIButton = {
        let pm = UIButton()
        pm.setTitle("프로필 관리", for: .normal)
        pm.titleLabel?.font = .systemFont(ofSize: 9, weight: .regular)
        pm.setTitleColor(.black, for: .normal)
        pm.backgroundColor = .white
        pm.layer.borderColor = UIColor.lightGray.cgColor
        pm.layer.cornerRadius = 8
        pm.layer.borderWidth = 1
        pm.layer.masksToBounds = true
        return pm
    }()
    
    // 프로필 공유 버튼
    lazy var shareProfileButton : UIButton = {
        let ps = UIButton()
        ps.setTitle("프로필 공유", for: .normal)
        ps.titleLabel?.font = .systemFont(ofSize: 9, weight: .regular)
        ps.setTitleColor(.black, for: .normal)
        ps.backgroundColor = .white
        ps.layer.borderColor = UIColor.lightGray.cgColor
        ps.layer.cornerRadius = 8
        ps.layer.borderWidth = 1
        ps.layer.masksToBounds = true
        return ps
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI setup
    private func setupUI(){
        self.backgroundColor = .white
        
        // 프로필 사진
        self.addSubview(profileImage)
        profileImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(126)
            $0.leading.equalToSuperview().offset(32.5)
            $0.height.width.equalTo(90)
        }
        
        // 프로필 이름
        self.addSubview(userName)
        userName.snp.makeConstraints{
            $0.top.equalToSuperview().offset(147)
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
            $0.height.equalTo(23)
        }
        
        // 팔로워
        self.addSubview(userFollower)
        userFollower.snp.makeConstraints{
            $0.top.equalTo(userName).offset(23+6)
            $0.leading.equalTo(userName)
            $0.height.equalTo(19)
        }
        
        // 팔로잉
        self.addSubview(userFollowing)
        userFollowing.snp.makeConstraints{
            $0.top.equalTo(userFollower)
            $0.leading.equalTo(userFollower.snp.trailing).offset(8)
            $0.height.equalTo(19)
        }
        
        // 설정버튼
        self.addSubview(setupButton)
        setupButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalToSuperview().offset(32.5)
            $0.trailing.equalToSuperview().inset(333.5)
            $0.height.width.equalTo(25)
        }
        
        // 카메라버튼
        self.addSubview(cameraButton)
        cameraButton.snp.makeConstraints{
            $0.top.equalTo(setupButton)
            $0.leading.equalTo(setupButton.snp.trailing).offset(277)
            $0.height.width.equalTo(25)
        }
        
        
        // 프로필 관리 버튼
        self.addSubview(editProfileButton)
        editProfileButton.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(32.5)
            $0.trailing.equalToSuperview().inset(203.5)
            $0.height.equalTo(26)
            $0.width.equalTo(157)
        }
        
        // 프로필 공유 버튼
        self.addSubview(shareProfileButton)
        shareProfileButton.snp.makeConstraints{
            $0.top.equalTo(editProfileButton)
            $0.leading.equalTo(editProfileButton.snp.trailing).offset(14)
            $0.trailing.equalToSuperview().inset(32.5)
            $0.height.equalTo(26)
            $0.width.equalTo(157)
        }
        
    }
}


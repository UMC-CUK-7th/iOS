//
//  MypageView.swift
//  KREAM
//
//  Created by 서재민 on 10/7/24.
//

import Foundation
import UIKit
import SnapKit



class MypageView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addcomponents()
    }
    
    private func addcomponents() {
        
        //제약조건
        self.settingButton.snp.makeConstraints({ make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(30)
            make.leading.equalToSuperview().inset(32.5)
            make.width.equalTo(25)
        })
        
        self.cameraButton.snp.makeConstraints({ make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(30)
            make.trailing.equalToSuperview().inset(33.5)
            make.width.equalTo(25)
        })
        
        self.ProfileImage.snp.makeConstraints({ make in
            make.top.equalTo(settingButton.snp.bottom).offset(26)
            make.width.height.equalTo(90)
        })
        
        self.profileNameLabel.snp.makeConstraints({ make in
            make.top.equalTo(settingButton.snp.bottom).offset(47)
            make.leading.equalTo(ProfileImage.snp.trailing).offset(16)
            
        })
        self.profileFollowerLabel.snp.makeConstraints({ make in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(6)
            make.leading.equalTo(ProfileImage.snp.trailing).offset(16)
        })
        self.profileFollowingLabel.snp.makeConstraints({ make in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(6)
            make.leading.equalTo(profileFollowerLabel.snp.trailing).offset(8)
            
        })
        self.ProfileManageButton.snp.makeConstraints({ make in
            make.top.equalTo(ProfileImage.snp.bottom).offset(26)
            make.leading.equalToSuperview().inset(32.5)
        })
        
        self.ProfileShareButton.snp.makeConstraints({ make in
            make.top.equalTo(ProfileImage.snp.bottom).offset(26)
            make.trailing.equalToSuperview().inset(33.5)
        })
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //status bar
    
    
    // 상단 버튼 모음
    public lazy var settingButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "setting.png"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = UIColor.white.cgColor
        return btn
    }()
    
    public lazy var cameraButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "camera.png"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = UIColor.white.cgColor
        return btn
    }()
    // 프로필 이미지  둥글게 잘라야함
    public lazy var ProfileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profile.png")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 1
        image.layer.cornerRadius = 100
        image.clipsToBounds = true
        return image
    }()
    
    // 프로필 텍스트 label
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "JM_iOS"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        return label
        
    }()
    
    let profileFollowerLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        return label
        
    }()
    
    let profileFollowingLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        return label
        
    }()
    
    
    
    
    
    // 프로필 관리 버튼
    public lazy var ProfileManageButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 관리", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = UIColor (hex: "#A2A2A2").cgColor
        btn.layer.borderWidth = 2.0
        btn.layer.cornerRadius = 10.0
        btn.layer.masksToBounds = true
        return btn
        
    }()
    //프로필 공유 버튼
    public lazy var ProfileShareButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 공유", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = UIColor (hex: "#A2A2A2").cgColor
        btn.layer.borderWidth = 2.0
        btn.layer.cornerRadius = 10.0
        btn.layer.masksToBounds = true
        
        return btn
        
    }()
    
}


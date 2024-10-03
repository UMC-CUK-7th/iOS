//
//  MyPageView.swift
//  KreamCloneCoding
//
//  Created by 김승원 on 9/27/24.
//

// 워크북 2주차

import UIKit
import SnapKit

class MyPageView: UIView {
    // MARK: - UI Components
    // 설정 버튼
    let settingButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "gearshape"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    // 카메라 버튼
    let cameraButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "camera"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    // 프로필 사진
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profileImage")
        iv.contentMode = .scaleAspectFill
        iv.layer.borderWidth = 1 // 원래 외각선 없는데, 그냥 넣음 ^^
        return iv
    }()
    
    // 프로필 id label
    let idLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Won_iOS"
        lb.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lb.textColor = .black
        lb.textAlignment = .left
        
        return lb
    }()
    
    // 팔로우 팔로잉 label (하드코딩)
    let followLabel: UILabel = {
        let lb = UILabel()
        lb.text = "팔로워 325  팔로잉 21"
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .black
        lb.textAlignment = .left
        return lb
    }()
    
    // stackView
    lazy var labelStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [idLabel, followLabel])
        sv.axis = .vertical
        sv.spacing = 6
        sv.alignment = .leading
        sv.distribution = .fill
        return sv
    }()
    
    // 프로필 관리 버튼
    lazy var manageProfileButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 관리", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 9, weight: .regular)
        
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.masksToBounds = true
        return btn
    }()
    
    lazy var shareProfileButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 공유", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 9, weight: .regular)
        
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.masksToBounds = true
        return btn
    }()
    
    lazy var buttonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [manageProfileButton, shareProfileButton])
        sv.axis = .horizontal
        sv.spacing = 14
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()
    
    // 
    let emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        /*
         하위 뷰의 크기가 결정되는 시점 함수
         애플이 만들어놓은 함수
         이 함수에서 아래 코드를 작성해야 완전 동그랗게 잘림
         */
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.backgroundColor = .white
        
        self.addSubview(settingButton)
        self.addSubview(cameraButton)
        self.addSubview(profileImageView)
        self.addSubview(labelStackView)
        self.addSubview(buttonStackView)
        self.addSubview(emptyView)
        
        setupConstraints()
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        settingButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32.5)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(30)
            make.width.height.equalTo(25)
        }
        
        cameraButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(32.5)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(30)
            make.width.height.equalTo(25)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32.5)
            make.top.equalTo(self.settingButton.snp.bottom).offset(26)
            make.width.height.equalTo(90)
        }
        
        idLabel.snp.makeConstraints { make in
            make.height.equalTo(23)
        }
        
        followLabel.snp.makeConstraints { make in
            make.height.equalTo(19)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.leading.equalTo(self.profileImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(32.5)
            make.top.equalTo(self.profileImageView.snp.top).offset(21)
        }
        
        manageProfileButton.snp.makeConstraints { make in
            make.height.equalTo(26)
        }
        
        shareProfileButton.snp.makeConstraints { make in
            make.height.equalTo(26)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(26)
            make.leading.trailing.equalToSuperview().inset(32.5)
        }
        
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(29)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

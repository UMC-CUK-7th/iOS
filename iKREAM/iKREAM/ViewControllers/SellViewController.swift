//
//  SellViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 11/5/24.
//

import UIKit
import SnapKit

class SellViewController: UIViewController {
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "구매하기"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "(가격 단위: 원)"
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "matinkim") // 사용할 이미지 이름 설정
        imageView.contentMode = .scaleAspectFit // 이미지 모드 설정
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "마뗑킴 로고 코팅 점퍼 블랙"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    private let SButton: UIButton = {
        let button = UIButton()
        button.setTitle("S", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = UIColor.clear // 배경을 투명하게
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.3 // 테두리 두께
        button.layer.cornerRadius = 8.0 // 직사각형의 부드러운 둥근 모서리 설정
        button.clipsToBounds = true // 모서리를 둥글게 클리핑
        return button
    }()
    
    private let MButton: UIButton = {
        let button = UIButton()
        button.setTitle("M", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = UIColor.clear // 배경을 투명하게
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.3  // 테두리 두께
        button.layer.cornerRadius = 8.0 // 직사각형의 부드러운 둥근 모서리 설정
        button.clipsToBounds = true // 모서리를 둥글게 클리핑
        return button
    }()
    
    private let LButton: UIButton = {
        let button = UIButton()
        button.setTitle("L", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = UIColor.clear // 배경을 투명하게
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.3// 테두리 두께
        button.layer.cornerRadius = 8.0 // 직사각형의 부드러운 둥근 모서리 설정
        button.clipsToBounds = true // 모서리를 둥글게 클리핑
        return button
    }()
    
    private let XLButton: UIButton = {
        let button = UIButton()
        button.setTitle("XL", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = UIColor.clear // 배경을 투명하게
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.3  // 테두리 두께
        button.layer.cornerRadius = 8.0 // 직사각형의 부드러운 둥근 모서리 설정
        button.clipsToBounds = true // 모서리를 둥글게 클리핑
        return button
    }()
    
    private let XXLButton: UIButton = {
        let button = UIButton()
        button.setTitle("XXL", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = UIColor.clear // 배경을 투명하게
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.3 // 테두리 두께
        button.layer.cornerRadius = 8.0 // 직사각형의 부드러운 둥근 모서리 설정
        button.clipsToBounds = true // 모서리를 둥글게 클리핑
        return button
    }()
    
    private let priceLabelS: UILabel = {
        let label = UILabel()
        label.text = "360,000"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .systemRed
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabelM: UILabel = {
        let label = UILabel()
        label.text = "360,000"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .systemRed
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabelL: UILabel = {
        let label = UILabel()
        label.text = "360,000"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .systemRed
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabelXL: UILabel = {
        let label = UILabel()
        label.text = "360,000"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .systemRed
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabelXXL: UILabel = {
        let label = UILabel()
        label.text = "360,000"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .systemRed
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()  // UI 요소 추가
        setupConstraints()  // 제약 조건 설정
        
        // 버튼 클릭 시 모달 닫기
        closeButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)

        // 사이즈 버튼 클릭 이벤트
        [SButton, MButton, LButton, XLButton, XXLButton].forEach { button in
            button.addTarget(self, action: #selector(sizeButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    private func setupUI() {
        // 모든 UI 요소를 view에 추가
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(detailLabel)
        view.addSubview(SButton)
        view.addSubview(MButton)
        view.addSubview(LButton)
        view.addSubview(XLButton)
        view.addSubview(XXLButton)
        SButton.addSubview(priceLabelS)
        MButton.addSubview(priceLabelM)
        LButton.addSubview(priceLabelL)
        XLButton.addSubview(priceLabelXL)
        XXLButton.addSubview(priceLabelXXL)
        

        
    }
    
    private func setupConstraints() {
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(162)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(158)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(11)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.width.height.equalTo(91)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(29)
            make.leading.equalTo(imageView.snp.trailing).offset(15)
        }
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.equalTo(imageView.snp.trailing).offset(15)
        }
        SButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(35)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(15)
            make.width.equalTo(110)
            make.height.equalTo(47)
        }
        MButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(35)
            make.leading.equalTo(SButton.snp.trailing).offset(7)
            make.width.equalTo(110)
            make.height.equalTo(47)
        }
        LButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(35)
            make.leading.equalTo(MButton.snp.trailing).offset(7)
            make.width.equalTo(110)
            make.height.equalTo(47)
        }
        XLButton.snp.makeConstraints { make in
            make.top.equalTo(SButton.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(15)
            make.width.equalTo(110)
            make.height.equalTo(47)
        }
        XXLButton.snp.makeConstraints { make in
            make.top.equalTo(SButton.snp.bottom).offset(8)
            make.leading.equalTo(XLButton.snp.trailing).offset(7)
            make.width.equalTo(110)
            make.height.equalTo(47)
        }
        priceLabelS.snp.makeConstraints { make in
            make.top.equalTo(SButton.snp.top).offset(29)
            make.leading.equalTo(SButton.snp.leading).offset(32)
        }
        priceLabelM.snp.makeConstraints { make in
            make.top.equalTo(MButton.snp.top).offset(29)
            make.leading.equalTo(MButton.snp.leading).offset(32)
        }
        priceLabelL.snp.makeConstraints { make in
            make.top.equalTo(LButton.snp.top).offset(29)
            make.leading.equalTo(LButton.snp.leading).offset(32)
        }
        priceLabelXL.snp.makeConstraints { make in
            make.top.equalTo(XLButton.snp.top).offset(29)
            make.leading.equalTo(XLButton.snp.leading).offset(32)
        }
        priceLabelXXL.snp.makeConstraints { make in
            make.top.equalTo(XXLButton.snp.top).offset(29)
            make.leading.equalTo(XXLButton.snp.leading).offset(32)
        }
    }

    @objc private func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func sizeButtonTapped(_ sender: UIButton) {
        resetButtonBorders()
        
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 1.0
    }
    
    // 모든 사이즈 버튼의 테두리를 초기화
    private func resetButtonBorders() {
        let buttons = [SButton, MButton, LButton, XLButton, XXLButton]
        buttons.forEach { button in
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
    }

    //메소드를 통해 코드 중복을 줄이고 버튼 생성을 간소화 해준다
    private static func createSizeButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = UIColor.clear
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.3
        button.layer.cornerRadius = 8.0
        button.clipsToBounds = true
        return button
    }
}

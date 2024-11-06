//
//  SearchView.swift
//  iKREAM
//
//  Created by 김윤진 on 11/5/24.
//

import UIKit
import SnapKit
import Then

// MARK: - Custom Components
class CustomImageView: UIImageView {
    init(imageName: String, contentMode: UIView.ContentMode = .scaleAspectFill) {
        super.init(frame: .zero)
        self.image = UIImage(named: imageName)
        self.contentMode = contentMode
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomLabel: UILabel {
    init(text: String, fontSize: CGFloat, weight: UIFont.Weight, textColor: UIColor = .black, textAlignment: NSTextAlignment = .center) {
        super.init(frame: .zero)
        self.text = text
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
        self.textAlignment = textAlignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomButton: UIButton {
    init(title: String, backgroundColor: UIColor, titleColor: UIColor, fontSize: CGFloat, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: fontSize, weight: .semibold)
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SearchView
class SearchView: UIView {
    
    // Components
    private let jumperImageView = CustomImageView(imageName: "matinkim")
    let matinCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = 8
        }
        return UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true
            $0.register(matinCollectionViewCell.self, forCellWithReuseIdentifier: matinCollectionViewCell.identifier)
        }
    }()
    
    private let nowLabel = CustomLabel(text: "즉시 구매가", fontSize: 12, weight: .light)
    private let priceLabel = CustomLabel(text: "228,000원", fontSize: 20, weight: .bold)
    private let nameLabel = CustomLabel(text: "Matin Kim Logo Coating Jumper", fontSize: 16, weight: .medium)
    private let detailLabel = CustomLabel(text: "마뗑킴 로고 코팅 점퍼 블랙", fontSize: 12, weight: .light)
    
    private let saveImageView = CustomImageView(imageName: "matinsaved")
    private let saveLabel = CustomLabel(text: "2,122", fontSize: 12, weight: .light)
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("구매", for: .normal)
        button.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0) // 공백위한.
        button.layer.cornerRadius = 8
        return button
    }()

    let sellButton: UIButton = {
        let button = UIButton()
        button.setTitle("판매", for: .normal)
        button.backgroundColor = UIColor(red: 65/255, green: 185/255, blue: 122/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0) // 공백위한.
        
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let subLabel = CustomLabel(text: "345,000", fontSize: 13, weight: .semibold, textColor: .white)
    private let sub2Label = CustomLabel(text: "즉시 구매가", fontSize: 10, weight: .light, textColor: UIColor(red: 163/255, green: 55/255, blue: 35/255, alpha: 1))
    
    private let sub3Label = CustomLabel(text: "396,000", fontSize: 13, weight: .semibold, textColor: .white)
    private let sub4Label = CustomLabel(text: "즉시 판매가", fontSize: 10, weight: .light, textColor: UIColor(red: 31/255, green: 119/255, blue: 69/255, alpha: 1))
    
    // Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        self.backgroundColor = .white
        addSubviews(jumperImageView, matinCollectionView, nowLabel, priceLabel, nameLabel, detailLabel, saveImageView, saveLabel, buyButton, sellButton)
        buyButton.addSubviews(subLabel, sub2Label)
        sellButton.addSubviews(sub3Label, sub4Label)
        setupConstraints()
    }
    
    // MARK: - SetupConstraints
        private func setupConstraints() {
            jumperImageView.snp.makeConstraints { make in
                make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(13)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.height.equalTo(373)
            }
            matinCollectionView.snp.makeConstraints { make in
                make.top.equalTo(jumperImageView.snp.bottom).offset(20)
                make.leading.equalToSuperview()
                make.height.equalTo(56)
                make.width.equalTo(421)
            }
            nowLabel.snp.makeConstraints { make in
                make.top.equalTo(matinCollectionView.snp.bottom).offset(23)
                make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
            }
            priceLabel.snp.makeConstraints { make in
                make.top.equalTo(nowLabel.snp.bottom).offset(4)
                make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
            }
            nameLabel.snp.makeConstraints { make in
                make.top.equalTo(priceLabel.snp.bottom).offset(18)
                make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
            }
            detailLabel.snp.makeConstraints { make in
                make.top.equalTo(nameLabel.snp.bottom).offset(6)
                make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
            }
            saveImageView.snp.makeConstraints { make in
                make.top.equalTo(detailLabel.snp.bottom).offset(66)
                make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(17)
                make.width.height.equalTo(26)
            }
            saveLabel.snp.makeConstraints { make in
                make.top.equalTo(saveImageView.snp.bottom).offset(2)
                make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(16)
            }
            buyButton.snp.makeConstraints { make in
                make.top.equalTo(detailLabel.snp.bottom).offset(62)
                make.leading.equalTo(saveImageView.snp.trailing).offset(19)
                make.width.equalTo(147)
                make.height.equalTo(49)
            }
            subLabel.snp.makeConstraints { make in
                make.top.equalTo(buyButton.snp.top).offset(8)
                make.leading.equalTo(buyButton.snp.leading).offset(59)
            }
            sub2Label.snp.makeConstraints { make in
                make.top.equalTo(subLabel.snp.bottom).offset(2)
                make.leading.equalTo(buyButton.snp.leading).offset(59)
                
            }
            sellButton.snp.makeConstraints { make in
                make.top.equalTo(detailLabel.snp.bottom).offset(62)
                make.leading.equalTo(buyButton.snp.trailing).offset(6)
                make.width.equalTo(147)
                make.height.equalTo(49)
            }
            sub3Label.snp.makeConstraints{ make in
                make.top.equalTo(sellButton.snp.top).offset(8)
                make.leading.equalTo(sellButton.snp.leading).offset(59)
            }
            sub4Label.snp.makeConstraints{ make in
                make.top.equalTo(sub3Label.snp.bottom).offset(2)
                make.leading.equalTo(sellButton.snp.leading).offset(59)
            }
    }
}

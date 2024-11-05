//
//  SearchView.swift
//  iKREAM
//
//  Created by 김윤진 on 11/5/24.
//

import UIKit
import SnapKit
import Then

class SearchView: UIView {

    let jumperImageView: UIImageView = {
        let jv = UIImageView()
        jv.image = UIImage(named: "matinkim")
        jv.contentMode = .scaleAspectFill
        return jv
    }()
    
    let matinCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal // 가로 방향 스크롤
        $0.minimumInteritemSpacing = 8 // 좌우 간격
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true // 스크롤을 가능하도록 설정
        $0.register(matinCollectionViewCell.self, forCellWithReuseIdentifier: matinCollectionViewCell.identifier)
    }
    
    let nowLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
        $0.text = "즉시 구매가"
        $0.textAlignment = .center
        $0.isHidden = false
    }
    
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.text = "228,000원"
        $0.textAlignment = .center
        $0.isHidden = false
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .black
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.textAlignment = .center
        $0.isHidden = false
    }
    
    let detailLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.textAlignment = .center
        $0.isHidden = false
    }
    
    let saveImageView: UIImageView = {
        let sv = UIImageView()
        sv.image = UIImage(named: "matinsaved")
        sv.contentMode = .scaleAspectFill
        return sv
    }()
    
    let saveLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
        $0.text = "2,122"
        $0.textAlignment = .center
        $0.isHidden = false
    }
    
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
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "345,000"
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let sub2Label: UILabel = {
        let label = UILabel()
        label.text = "즉시 구매가"
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = UIColor(red: 163/255, green: 55/255, blue: 35/255, alpha: 1)
        return label
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
    
    let sub3Label: UILabel = {
        let label = UILabel()
        label.text = "396,000"
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let sub4Label: UILabel = {
        let label = UILabel()
        label.text = "즉시 판매가"
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = UIColor(red: 31/255, green: 119/255, blue: 69/255, alpha: 1)
        return label
    }()
    
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
        self.addSubviews(jumperImageView)
        self.addSubviews(matinCollectionView)
        self.addSubviews(nowLabel)
        self.addSubviews(priceLabel)
        self.addSubviews(nameLabel)
        self.addSubviews(detailLabel)
        self.addSubviews(saveImageView)
        self.addSubviews(saveLabel)
        self.addSubviews(buyButton)
        buyButton.addSubviews(subLabel)
        buyButton.addSubviews(sub2Label)
        self.addSubviews(sellButton)
        sellButton.addSubviews(sub3Label)
        sellButton.addSubviews(sub4Label)
        
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

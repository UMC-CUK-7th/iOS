//  DroppedCollectionViewCell.swift
//  iKREAM
//
//  Created by 김윤진 on 10/30/24.
//

import UIKit
import SnapKit

// // MARK: - DIP 적용: 뷰 모델 정의
struct DroppedItemViewModel {
    let image: UIImage
    let cornerText: String
    let bottomRightImage: UIImage
    let title: String
    let description: String
    let price: String
    let availability: String
}

class DroppedCollectionViewCell: UICollectionViewCell {
    static let identifier = "DroppedCollectionViewCell"
    
    // 이미지 뷰
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
    }
    
    // 오른쪽 위 모서리 텍스트
    let cornerTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .lightGray
        $0.textAlignment = .center
        $0.clipsToBounds = true
    }
    
    // 오른쪽 아래 이미지
    let bottomRightImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    // 제목 텍스트
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
    }
    
    // 설명 텍스트
    let descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .gray
    }
    
    // 가격 텍스트
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .bold)
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    // 거래 가능 텍스트
    let availableLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .thin)
        $0.textColor = .lightGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup (SRP 적용)
    private func setupView() {
        setupLabels()
        setupImages()
    }
    
    private func setupLabels() {
        addSubview(cornerTextLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        addSubview(availableLabel)
    }
    
    private func setupImages() {
        addSubview(imageView)
        addSubview(bottomRightImageView)
    }
    
    private func setupConstraints() {
        // 이미지 뷰 제약 설정
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.height.equalTo(142)
        }
        
        // 오른쪽 위 모서리 텍스트 제약 설정
        cornerTextLabel.snp.makeConstraints {
            $0.top.equalTo(imageView).offset(8)
            $0.trailing.equalTo(imageView).offset(-8)
            $0.width.equalTo(50)
            $0.height.equalTo(20)
        }
        
        // 오른쪽 아래 이미지 제약 설정
        bottomRightImageView.snp.makeConstraints {
            $0.bottom.equalTo(imageView).offset(-8)
            $0.trailing.equalTo(imageView).offset(-9)
            $0.width.equalTo(22)
            $0.height.equalTo(20)
        }
        
        // 제목 텍스트 제약 설정
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(5)
            $0.width.equalTo(40)
            $0.height.equalTo(14)
        }
        
        // 설명 텍스트 제약 설정
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(5)
            $0.width.equalTo(126)
            $0.height.equalTo(30)
        }
        
        // 가격 텍스트 제약 설정
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(5)
            $0.width.equalTo(69)
            $0.height.equalTo(18)
        }
        
        // 거래 가능 텍스트 제약 설정
        availableLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().offset(5)
            $0.width.equalTo(48)
            $0.height.equalTo(14)
        }
    }
    
    // MARK: - Configure Cell with ViewModel (DIP 적용)
    func configure(with viewModel: DroppedItemViewModel) {
        imageView.image = viewModel.image
        cornerTextLabel.text = viewModel.cornerText
        bottomRightImageView.image = viewModel.bottomRightImage
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        priceLabel.text = viewModel.price
        availableLabel.text = viewModel.availability
    }
}

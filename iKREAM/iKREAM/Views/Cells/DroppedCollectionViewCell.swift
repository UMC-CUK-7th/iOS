//  DroppedCollectionViewCell.swift
//  iKREAM
//
//  Created by 김윤진 on 10/30/24.
//

import UIKit
import SnapKit

class DroppedCollectionViewCell: UICollectionViewCell {
    static let identifier = "DroppedCollectionViewCell"
    
    // 이미지 뷰
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 5 // 모서리 반경을 줄여서 약간 둥근 모양으로 설정
        $0.clipsToBounds = true
    }
    
    // 오른쪽 위 모서리 텍스트
    let cornerTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .lightGray
        //$0.backgroundColor = UIColor.black.withAlphaComponent(0.6) // 배경색 설정
        $0.textAlignment = .center
        //$0.layer.cornerRadius = 5
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
        $0.textColor = .gray
    }
    
    // 가격 텍스트
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .bold)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(cornerTextLabel)
        addSubview(bottomRightImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        addSubview(availableLabel)
        
        // 이미지 뷰 제약 설정
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.height.equalTo(142) // 원하는 높이로 설정
        }
        
        // 오른쪽 위 모서리 텍스트 제약 설정
        cornerTextLabel.snp.makeConstraints {
            $0.top.equalTo(imageView).offset(8)
            $0.trailing.equalTo(imageView).offset(-8)
            $0.width.equalTo(50) // 원하는 너비로 설정
            $0.height.equalTo(20) // 원하는 높이로 설정
        }
        
        // 오른쪽 아래 이미지 제약 설정
        bottomRightImageView.snp.makeConstraints {
            $0.bottom.equalTo(imageView).offset(-8)
            $0.trailing.equalTo(imageView).offset(-9)
            $0.width.equalTo(44)
            $0.height.equalTo(11)
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
            $0.width.equalTo(65)
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
    
}
    

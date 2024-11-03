//
//  HomeCollectionViewCell.swift
//  KREAM
//
//  Created by 류한비 on 10/23/24.
//

import UIKit
import SnapKit
import Then

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    // 셀 이미지
    let collectionImage = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    // 셀 타이틀
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup UI
    private func setupUI(){
        addSubview(collectionImage)
        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    //MARK: - setup Constraints
    private func setupConstraints(){
        // 셀 이미지
        collectionImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.width.equalTo(61)
            $0.centerX.equalToSuperview()
        }
        
        // 셀 타이틀
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(collectionImage.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
    }
}

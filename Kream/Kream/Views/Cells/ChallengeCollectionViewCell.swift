//
//  ChallengeCollectionViewCell.swift
//  KREAM
//
//  Created by 류한비 on 10/29/24.
//

import UIKit
import SnapKit
import Then

class ChallengeCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChallengeCollectionViewCell"
    
    // 셀 이미지
    let productImage = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImage.layer.cornerRadius = 8
    }
    
    // 셀 타이틀
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .white
        $0.textAlignment = .left
    }
    
    override init (frame: CGRect){
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupUI
    private func setupUI(){
        addSubview(productImage)
        productImage.addSubview(titleLabel)
        setupConstraints()
    }
    
    //MARK: - setupConstraints
    private func setupConstraints(){
        // 셀 이미지
        productImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.equalTo(165)
            $0.width.equalTo(124)
            $0.horizontalEdges.equalToSuperview()
        }
        
        // 셀 타이틀
        titleLabel.snp.makeConstraints{
            $0.bottom.equalTo(productImage.snp.bottom).inset(11)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(14)
        }
        
    }
}

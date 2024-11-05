//
//  DetailPageCollectionViewCell.swift
//  KREAM
//
//  Created by 류한비 on 11/5/24.
//

import UIKit
import SnapKit

class DetailPageCollectionViewCell: UICollectionViewCell {
    static let identifier = "DetailPageCollectionViewCell"
    
    override init (frame: CGRect){
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 상품 셀 이미지
    let productCellImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.borderWidth = 0.5
        return image
    }()
    
    
    //MARK: - setup UI
    private func setupUI(){
        addSubview(productCellImage)
        
        setupConstraints()
    }
    
    //MARK: - setup Constraints
    private func setupConstraints(){
        
        // 상품 셀 이미지
        productCellImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(53)
        }
    }
}

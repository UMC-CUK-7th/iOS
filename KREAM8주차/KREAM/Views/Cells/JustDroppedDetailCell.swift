//
//  ProductColorCell.swift
//  KREAM
//
//  Created by 서재민 on 11/5/24.
//

import UIKit
import SnapKit

class ProductColorCell: UICollectionViewCell {
    static let identifier: String = "ProductColorCell"
   
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(53)
            make.width.equalTo(53)
        }

    }
        
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


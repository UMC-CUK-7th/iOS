//
//  matinCollectionViewCell.swift
//  iKREAM
//
//  Created by 김윤진 on 11/5/24.
//

import UIKit

class matinCollectionViewCell: UICollectionViewCell {
    static let identifier = "matinCollectionViewCell"
    
    let matinView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 1
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews(matinView)
        
        matinView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.height.equalTo(53) // 원하는 높이로 설정
        }
    }
    
}

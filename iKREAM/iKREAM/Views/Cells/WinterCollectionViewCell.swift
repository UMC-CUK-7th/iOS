//
//  WinterCollectionViewCell.swift
//  iKREAM
//
//  Created by 김윤진 on 10/30/24.
//

import UIKit

class WinterCollectionViewCell: UICollectionViewCell {
    static let identifier = "WinterCollectionViewCell"
    
    // 이미지 뷰
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 5 // 모서리 반경을 줄여서 약간 둥근 모양으로 설정
        $0.clipsToBounds = true
    }
    
    // 인스타 아이디 텍스트
    let idLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .white
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
        addSubview(idLabel)
        
        // 이미지 뷰 제약 설정
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.equalTo(126)
            $0.height.equalTo(167)
        }
        
        // id 뷰 제약 설정
        idLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top).offset(142)
            $0.leading.equalToSuperview().offset(12)
        }
        
    }
    
}
    


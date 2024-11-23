//
//  chucheonCollectionViewCell.swift
//  iKREAM
//
//  Created by 김윤진 on 11/21/24.
//

import UIKit
import SnapKit
import Then

class chucheonCollectionViewCell: UICollectionViewCell {
    static let identifier = "chucheonCollectionViewCell"
    
    let chuView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20 // 경계 반경 설정
        $0.backgroundColor = .systemGray6
        $0.clipsToBounds = true
    }
    
    // 오른쪽 위 모서리 텍스트
    let supremeTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    private func setupView() {
        addSubviews(chuView, supremeTextLabel)
        
        chuView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(32)
        }
        
        supremeTextLabel.snp.makeConstraints { make in
            make.top.equalTo(chuView.snp.top).offset(8)
            make.leading.equalTo(chuView.snp.leading).offset(11)
        }
    }

}

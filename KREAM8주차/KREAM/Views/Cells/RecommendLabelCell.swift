//
//  RecommendLabelCell.swift
//  KREAM
//
//  Created by 서재민 on 11/20/24.
//

import UIKit

class RecommendLabelCell: UICollectionViewCell {
    //MARK: - Properties
    
    static let identifier = "RecommendLabelCell"
    
    
    
    //MARK: - UIComponents
    let label : UILabel = {
        let label = UILabel()
        label.text = "@@"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
       
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(11)
            make.top.equalToSuperview().inset(8)
        }
        
    }
        
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Func
    private func setupLayout() {
        contentView.backgroundColor = .systemGray6
           contentView.layer.cornerRadius = 10
           contentView.layer.masksToBounds = true
       }
}

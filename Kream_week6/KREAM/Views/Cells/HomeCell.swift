//
//  HomeCell.swift
//  KREAM
//
//  Created by 서재민 on 10/24/24.
//

import UIKit
import SnapKit

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "tlqkf"
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    
    
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetUpUI()
    }
        
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - SetUpUI()
    
    func SetUpUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(61)
            make.top.equalToSuperview().inset(0)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(4)
        }
    }
}

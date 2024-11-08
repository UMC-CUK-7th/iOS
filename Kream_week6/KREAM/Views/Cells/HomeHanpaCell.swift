//
//  HanpaCell.swift
//  KREAM
//
//  Created by 서재민 on 11/1/24.
//

import UIKit
import SnapKit
class HomeHanpaCell: UICollectionViewCell {
    static let identifier = "HomeHanpaCell"
   
    
    //MARK: - UIComponent
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
       setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        label.text = nil
    }
    
    private func setupUI(){
        addSubviews(imageView, label)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(165)
            make.width.equalTo(124)
        }
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(14)
        }
    }
}

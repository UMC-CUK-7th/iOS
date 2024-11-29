//
//  ProductCollectionViewCell.swift
//  KREAM
//
//  Created by 류한비 on 10/29/24.
//

import UIKit
import SnapKit
import Then

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    // 셀 이미지
    let productImage = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImage.layer.cornerRadius = 12 //이미지 Radius 12
    }
    
    // 셀 타이틀
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    // 설명
    let infoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    // 가격
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    // 즉시구매가
    let textLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.text = "즉시 구매가"
        $0.textColor = .lightGray
        $0.textAlignment = .left
    }
    
    // 거래수
    let countLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = .gray
        $0.textAlignment = .right
        $0.numberOfLines = 0
    }
    
    // 저장버튼
    let savedButton: UIButton = {
        let sb = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "save")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        sb.configuration = configuration
        return sb
    }()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configure
    func configure(with model: ProductModel) {
        if let url = URL(string: model.image) {
            productImage.kf.setImage(with: url) // Kingfisher로 이미지 로드
        }
        titleLabel.text = model.name
        infoLabel.text = model.info
        priceLabel.text = model.price
        countLabel.text = model.label
    }
    
    //MARK: - setupUI
    private func setupUI(){
        addSubview(productImage)
        addSubview(titleLabel)
        addSubview(infoLabel)
        addSubview(priceLabel)
        addSubview(textLabel)
        productImage.addSubview(countLabel)
        productImage.addSubview(savedButton)
        
        setupConstraints()
    }
    
    
    //MARK: - setupConstraints
    private func setupConstraints(){
        // 셀 이미지
        productImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.width.equalTo(142)
            $0.horizontalEdges.equalToSuperview()
        }
        
        // 셀 타이틀
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(productImage.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().offset(4)
            $0.height.equalTo(14)
        }
        
        // 설명
        infoLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
            $0.horizontalEdges.equalToSuperview().offset(4)
        }
        
        // 가격
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(infoLabel.snp.top).offset(26+14)
            $0.horizontalEdges.equalToSuperview().offset(4)
            $0.height.equalTo(16)
        }
        
        // 즉시구매가
        textLabel.snp.makeConstraints{
            $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(4)
            $0.height.equalTo(12)
        }
        
        // 거래수
        countLabel.snp.makeConstraints{
            $0.top.equalTo(productImage.snp.top).offset(8)
            $0.trailing.equalTo(productImage.snp.trailing).offset(-8)
            $0.height.equalTo(12)
        }
        
        // 저장버튼
        savedButton.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.top).offset(114.31)
            $0.leading.equalTo(productImage.snp.leading).offset(113.93)
            $0.width.equalTo(14.14)
            $0.height.equalTo(16.15)
        }
        
        
    }
}

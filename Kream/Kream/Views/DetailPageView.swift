//
//  DetailPageView.swift
//  KREAM
//
//  Created by 류한비 on 11/4/24.
//

import UIKit
import SnapKit
import Then

class DetailPageView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 상품 이미지
    let productImage: UIImageView = {
        let productImage = UIImageView()
        productImage.image = UIImage(named: "Stussy")
        productImage.contentMode = .scaleAspectFit
        return productImage
    }()
    
    // 즉시구매가
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "즉시 구매가"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    // 가격
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "195,000원"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    // 상품설명1
    let infoLabel1: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.text = "Basic Stussy Hoodie Ash Heather 2024"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    // 상품설명2
    let infoLabel2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "스투시 베이직 스투시 후드 애쉬 헤더 2024"
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    // 구분선
    let line : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray6
        return line
    }()
    
    // 저장버튼
    private lazy var savedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "savedButton"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // 저장수
    let savedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "1.3만"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // 구매버튼 배경
    private lazy var redButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "redBackground"), for: .normal)
        return button
    }()
    
    // 판매버튼 배경
    private lazy var greenButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "greenBackground"), for: .normal)
        return button
    }()
    
    // 구매
    let buyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "구매"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // 구매가
    let buyPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.text = "197,000"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    // 즉시 구매가
    let textLabel2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.text = "즉시 구매가"
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    // 판매
    let sellLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "판매"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // 판매가
    let sellPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.text = "186,000"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    
    // 즉시 판매가
    let textLabel3: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.text = "즉시 판매가"
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    // 아더컬러 UICollectionView
    let detailPageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal}).then{
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.register(DetailPageCollectionViewCell.self, forCellWithReuseIdentifier: DetailPageCollectionViewCell.identifier)
        }
    
    //MARK: - setup UI
    private func setupUI(){
        self.addSubview(productImage)
        self.addSubview(textLabel)
        self.addSubview(priceLabel)
        self.addSubview(infoLabel1)
        self.addSubview(infoLabel2)
        self.addSubview(line)
        self.addSubview(savedButton)
        self.addSubview(savedLabel)
        self.addSubview(redButton)
        self.addSubview(greenButton)
        self.addSubview(detailPageCollectionView)
        redButton.addSubview(buyLabel)
        redButton.addSubview(buyPriceLabel)
        redButton.addSubview(textLabel2)
        greenButton.addSubview(sellLabel)
        greenButton.addSubview(sellPriceLabel)
        greenButton.addSubview(textLabel3)
        setupConstraints()
    }
    
    
    //MARK: - setup Constraints
    private func setupConstraints(){
        
        // 상품 이미지
        productImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(93)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(373)
            $0.width.equalTo(374)
        }
        
        // 즉시구매가
        textLabel.snp.makeConstraints{
            $0.top.equalTo(productImage.snp.bottom).offset(96)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(14)
        }
        
        // 가격
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(textLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(24)
        }
        
        // 상품설명1
        infoLabel1.snp.makeConstraints{
            $0.top.equalTo(priceLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(19)
        }
        
        // 상품설명2
        infoLabel2.snp.makeConstraints{
            $0.top.equalTo(infoLabel1.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(14)
        }
        
        // 구분선
        line.snp.makeConstraints{
            $0.top.equalTo(infoLabel2.snp.bottom).offset(54)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        
        // 저장버튼
        savedButton.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(17)
            $0.height.width.equalTo(26)
        }
        
        // 저장수
        savedLabel.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(14)
        }
        
        // 구매버튼 배경
        redButton.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(8)
            $0.leading.equalTo(savedButton.snp.trailing).offset(19)
            $0.height.equalTo(49)
            $0.width.equalTo(147)
        }
        
        // 판매버튼 배경
        greenButton.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(8)
            $0.leading.equalTo(redButton.snp.trailing).offset(6)
            $0.height.equalTo(49)
            $0.width.equalTo(147)
        }
        // 구매
        buyLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(19)
        }
        
        // 구매가
        buyPriceLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(buyLabel.snp.trailing).offset(21)
            $0.height.equalTo(16)
        }
        
        
        // 즉시 구매가
        textLabel2.snp.makeConstraints{
            $0.top.equalTo(buyPriceLabel.snp.bottom).offset(2)
            $0.leading.equalTo(buyLabel.snp.trailing).offset(21)
            $0.height.equalTo(12)
        }
       
        
        // 판매
        sellLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(19)
        }
        
        
        // 판매가
        sellPriceLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(sellLabel.snp.trailing).offset(21)
            $0.height.equalTo(16)
        }

        
        // 즉시 판매가
        textLabel3.snp.makeConstraints{
            $0.top.equalTo(buyPriceLabel.snp.bottom).offset(2)
            $0.leading.equalTo(sellLabel.snp.trailing).offset(21)
            $0.height.equalTo(12)
        }
        
        // 아더컬러 UICollectionView
        detailPageCollectionView.snp.makeConstraints{
            $0.top.equalTo(productImage.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(15) // 그냥 내 마음대로^_^
            $0.trailing.equalToSuperview()
            $0.height.equalTo(53)
            $0.width.equalTo(1000)
        }
        
    }
}

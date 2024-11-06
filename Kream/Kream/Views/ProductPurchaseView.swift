//
//  ProductPurchaseView.swift
//  KREAM
//
//  Created by 류한비 on 11/6/24.
//

import UIKit
import SnapKit

class ProductPurchaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 구매하기 label
    let purchaseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "구매하기"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // 가격
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.text = "(가격 단위: 원)"
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    // 상품 이미지
    let productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "SesameImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImage.layer.cornerRadius = 10
    }
    
    // 상품설명1
    let infoLabel1: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "Basic Stussy Hoodie Ash Heather 2024"
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    // 상품설명2
    let infoLabel2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "베이직 스투시 후드 애쉬 헤더 2024"
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
    
    // 빠른배송 버튼 배경
    lazy var redButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "redBackground1"), for: .normal)
        return button
    }()
    
    // 일반배송 버튼 배경
    lazy var blackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackBackground"), for: .normal)
        return button
    }()
    
    // 빠른배송 가격
    let fastPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "214,000"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // 일반배송 가격
    let generalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "201,000"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // 빠른배송 label
    let fastLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.text = "빠른배송(1-2일 소요)"
        label.textColor = .systemGray6
        label.textAlignment = .center
        return label
    }()
    
    // 일반배송 label
    let genLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.text = "일반배송(5-7일 소요)"
        label.textColor = .systemGray6
        label.textAlignment = .center
        return label
    }()
    
    // 취소 버튼
    lazy var cancleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancle"), for: .normal)
        return button
    }()
    
    // S 버튼
    lazy var smallButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.layer.borderColor = UIColor.systemGray6.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.adjustsImageWhenHighlighted = false // 클릭시 회색 하이라이트 제거
        return button
    }()
    
    // S label
    let smallLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "S"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // S 가격
    let smallPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "209,000"
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    // M 버튼
    lazy var mediumButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.layer.borderColor = UIColor.systemGray6.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    // M label
    let mediumLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "M"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // M 가격
    let mediumPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "201,000"
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    // L 버튼
    lazy var largeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.layer.borderColor = UIColor.systemGray6.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    // L label
    let largeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "L"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // L 가격
    let largePriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "199,000"
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    // XL 버튼
    lazy var xlargeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.layer.borderColor = UIColor.systemGray6.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    // XL label
    let xlargeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "XL"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // XL 가격
    let xlargePriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "195,000"
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    // XXL 버튼
    lazy var xxlargeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteButton"), for: .normal)
        button.layer.borderColor = UIColor.systemGray6.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    // XXL label
    let xxlargeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "XL"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // XXL 가격
    let xxlargePriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "197,000"
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - setupUI
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubview(purchaseLabel)
        self.addSubview(priceLabel)
        self.addSubview(productImage)
        self.addSubview(infoLabel1)
        self.addSubview(infoLabel2)
        self.addSubview(line)
        self.addSubview(redButton)
        self.addSubview(blackButton)
        self.addSubview(cancleButton)
        self.addSubview(smallButton)
        self.addSubview(mediumButton)
        self.addSubview(largeButton)
        self.addSubview(xlargeButton)
        self.addSubview(xxlargeButton)
        redButton.addSubview(fastPriceLabel)
        redButton.addSubview(fastLabel)
        blackButton.addSubview(generalPriceLabel)
        blackButton.addSubview(genLabel)
        smallButton.addSubview(smallLabel)
        smallButton.addSubview(smallPriceLabel)
        mediumButton.addSubview(mediumLabel)
        mediumButton.addSubview(mediumPriceLabel)
        largeButton.addSubview(largeLabel)
        largeButton.addSubview(largePriceLabel)
        xlargeButton.addSubview(xlargeLabel)
        xlargeButton.addSubview(xlargePriceLabel)
        xxlargeButton.addSubview(xxlargeLabel)
        xxlargeButton.addSubview(xxlargePriceLabel)
        setupConstraints()
    }
    
    //MARK: - setup Constraints
    private func setupConstraints() {
        // 구매하기 label
        purchaseLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(18)
        }
        
        // 가격
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(purchaseLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(12)
        }
        
        // 상품 이미지
        productImage.snp.makeConstraints{
            $0.top.equalTo(priceLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(91)
        }
        
        // 상품설명1
        infoLabel1.snp.makeConstraints{
            $0.top.equalTo(priceLabel.snp.bottom).offset(29)
            $0.leading.equalTo(productImage.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(26)
        }
        
        // 상품설명2
        infoLabel2.snp.makeConstraints{
            $0.top.equalTo(infoLabel1.snp.bottom).offset(4)
            $0.leading.equalTo(infoLabel1)
            $0.height.equalTo(14)
        }
        
        // 구분선
        line.snp.makeConstraints{
            $0.top.equalTo(productImage.snp.bottom).offset(492)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        
        // 빠른배송 버튼 배경
        redButton.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(190)
            $0.height.equalTo(52)
            $0.width.equalTo(168)
        }
        
        // 일반배송 버튼 배경
        blackButton.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(10)
            $0.leading.equalTo(redButton.snp.trailing).offset(6)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
            $0.width.equalTo(168)
        }
        
        // 빠른배송 가격
        fastPriceLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(11)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        // 일반배송 가격
        generalPriceLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(11)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        // 빠른배송 label
        fastLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(28)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(12)
        }
        
        // 일반배송 label
        genLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(28)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(12)
        }
        
        // 취소버튼
        cancleButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(338)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.width.equalTo(20)
        }
        
        // S 버튼
        smallButton.snp.makeConstraints{
            $0.top.equalTo(productImage.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(15)
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }
        
        // S label
        smallLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        // S 가격
        smallPriceLabel.snp.makeConstraints{
            $0.top.equalTo(smallLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        // M 버튼
        mediumButton.snp.makeConstraints{
            $0.top.equalTo(smallButton)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }
        
        // M label
        mediumLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        // M 가격
        mediumPriceLabel.snp.makeConstraints{
            $0.top.equalTo(mediumLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        
        // L 버튼
        largeButton.snp.makeConstraints{
            $0.top.equalTo(smallButton)
            $0.leading.equalTo(mediumButton.snp.trailing).offset(7)
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }
        
        // L label
        largeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        // L 가격
        largePriceLabel.snp.makeConstraints{
            $0.top.equalTo(largeLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        // XL 버튼
        xlargeButton.snp.makeConstraints{
            $0.top.equalTo(smallButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(15)
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }
        
        // XL label
        xlargeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        // XL 가격
        xlargePriceLabel.snp.makeConstraints{
            $0.top.equalTo(xlargeLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        // XXL 버튼
        xxlargeButton.snp.makeConstraints{
            $0.top.equalTo(xlargeButton)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }
        
        // XXL label
        xxlargeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        // XXL 가격
        xxlargePriceLabel.snp.makeConstraints{
            $0.top.equalTo(xxlargeLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(14)
        }
    }
    
}



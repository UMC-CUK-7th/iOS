//
//  ProductPurchaseView.swift
//  KREAM
//
//  Created by 류한비 on 11/6/24.
//

import UIKit
import SnapKit

//MARK: - ProductSizeButton
class ProductSizeButton: UIButton {
    init(size: String, price: String) {
        super.init(frame: .zero)
        
        // 버튼 기본 배경
        setImage(UIImage(named: "whiteButton"), for: .normal)
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        adjustsImageWhenHighlighted = false  // 클릭시 회색 하이라이트 제거
        
        // 사이즈 label
        let sizeLabel = UILabel()
        sizeLabel.text = size
        sizeLabel.font = .systemFont(ofSize: 14, weight: .light)
        sizeLabel.textColor = .black
        sizeLabel.textAlignment = .center
        
        // 가격 label
        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.font = .systemFont(ofSize: 12, weight: .light)
        priceLabel.textColor = .red
        priceLabel.textAlignment = .center
        
        // setup UI
        self.addSubview(sizeLabel)
        self.addSubview(priceLabel)
        
        // setup Constraints
        sizeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(sizeLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - 배송 Button
class deliveryButton: UIButton{
    init(back: String,price: String, label: String){
        super.init(frame: .zero)
        
        setImage(UIImage(named: back), for: .normal)
        
        // 가격 label
        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.font = .systemFont(ofSize: 14, weight: .medium)
        priceLabel.textColor = .white
        priceLabel.textAlignment = .center
        
        // 배송 label
        let dLabel = UILabel()
        dLabel.font = .systemFont(ofSize: 10, weight: .light)
        dLabel.text = label
        dLabel.textColor = .systemGray6
        dLabel.textAlignment = .center
        
        // setup UI
        self.addSubview(priceLabel)
        self.addSubview(dLabel)
        
        // setup Constraints
        priceLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(11)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }
        
        dLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(28)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(12)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Label
class productLabel: UILabel{
    init(text: String, fontSize: CGFloat, weight: UIFont.Weight, color: UIColor, alignment: NSTextAlignment){
        super.init(frame: .zero)
        
        self.text = text
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.textColor = color
        self.textAlignment = alignment
        numberOfLines = 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ProductPurchaseView (main)
class ProductPurchaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 구매하기
    let purchaseLabel = productLabel(text: "구매하기", fontSize: 15, weight: .semibold, color: .black, alignment: .center)
    // 가격
    let priceLabel = productLabel(text: "(가격 단위: 원)", fontSize: 10, weight: .light, color: .lightGray, alignment: .center)

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
    let infoLabel1 = productLabel(text: "Basic Stussy Hoodie Ash Heather 2024", fontSize: 14, weight: .light, color: .black, alignment: .left)
    // 상품설명2
    let infoLabel2 = productLabel(text: "베이직 스투시 후드 애쉬 헤더 2024", fontSize: 12, weight: .light, color: .lightGray, alignment: .left)
    
    // 구분선
    let line : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray6
        return line
    }()
    
    // 배송 버튼
    lazy var redButton = deliveryButton(back: "redBackground1", price: "214,000", label: "빠른배송(1-2일 소요)")
    lazy var blackButton = deliveryButton(back: "blackBackground", price: "201,000", label: "일반배송(5-7일 소요)")
    
    // 취소 버튼
    lazy var cancleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancle"), for: .normal)
        return button
    }()
    
    // 사이즈 Button
    lazy var smallButton = ProductSizeButton(size: "S", price: "209,000")
    lazy var mediumButton = ProductSizeButton(size: "M", price: "201,000")
    lazy var largeButton = ProductSizeButton(size: "L", price: "199,000")
    lazy var xlargeButton = ProductSizeButton(size: "XL", price: "195,000")
    lazy var xxlargeButton = ProductSizeButton(size: "XXL", price: "197,000")
    
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
        
        // M 버튼
        mediumButton.snp.makeConstraints{
            $0.top.equalTo(smallButton)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }
        
        // L 버튼
        largeButton.snp.makeConstraints{
            $0.top.equalTo(smallButton)
            //$0.leading.equalTo(mediumButton.snp.trailing).offset(7)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }
        
        // XL 버튼
        xlargeButton.snp.makeConstraints{
            $0.top.equalTo(smallButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(15)
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }
        
        // XXL 버튼
        xxlargeButton.snp.makeConstraints{
            $0.top.equalTo(xlargeButton)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(47)
            $0.width.equalTo(110)
        }

    }
    
}


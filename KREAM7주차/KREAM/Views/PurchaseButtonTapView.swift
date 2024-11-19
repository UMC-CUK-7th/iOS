//
//  PurchaseButtonTapView.swift
//  KREAM
//
//  Created by 서재민 on 11/8/24.
//

import UIKit
import SnapKit
class PurchaseButtonTapView: UIView {
    //MARK: - UIComponent
    
    
    let purchaseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let purchaseSubLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    let XButton: UIButton = {
        let button = UIButton()
        //        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "XButton.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Karina.png")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Karina"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let productSubNameLabel: UILabel = {
        let label = UILabel()
        label.text = "카리나"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    
    
    let sizeSButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()//subtitle을 만들기 위한 객체
        config.attributedTitle = AttributedString("S", attributes: AttributeContainer([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]))
        config.attributedSubtitle = AttributedString("36,000", attributes: AttributeContainer([.foregroundColor: UIColor.systemRed, .font: UIFont.systemFont(ofSize: 12)]))
        config.titleAlignment = .center
        button.configuration = config
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        return button
    }()
    
    let sizeMButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("M", attributes: AttributeContainer([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]))
        config.attributedSubtitle = AttributedString("361,000", attributes: AttributeContainer([.foregroundColor: UIColor.systemRed, .font: UIFont.systemFont(ofSize: 12)]))
        config.titleAlignment = .center
        button.configuration = config
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        return button
    }()
    
    let sizeLButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()//subtitle을 만들기위한 객체
        config.attributedTitle = AttributedString("L", attributes: AttributeContainer([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]))
        config.attributedSubtitle = AttributedString("23,000", attributes: AttributeContainer([.foregroundColor: UIColor.systemRed, .font: UIFont.systemFont(ofSize: 12)]))
        config.titleAlignment = .center
        button.configuration = config
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        return button
    }()
    
    let sizeXLButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()//subtitle을 만들기위한 객체
        
        config.attributedTitle = AttributedString("XL", attributes: AttributeContainer([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]))
        config.attributedSubtitle = AttributedString("45,000", attributes: AttributeContainer([.foregroundColor: UIColor.systemRed, .font: UIFont.systemFont(ofSize: 12)]))
        config.titleAlignment = .center
        button.configuration = config
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        return button
    }()
    
    let sizeXXLButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()//subtitle을 만들기위한 객체
        config.attributedTitle = AttributedString("XXL", attributes: AttributeContainer([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 14)]))
        config.attributedSubtitle = AttributedString("50,000", attributes: AttributeContainer([.foregroundColor: UIColor.systemRed, .font: UIFont.systemFont(ofSize: 12)]))
        config.titleAlignment = .center
        button.configuration = config
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        return button
    }()
    
    let dividedLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let fastDeliveryButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemRed
        config.title = "345,000"
        config.subtitle = "빠른 배송(1-2일 소모)"
        config.attributedTitle = AttributedString("345,000", attributes: AttributeContainer([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 14, weight: .bold)]))
        config.attributedSubtitle = AttributedString("빠른 배송(1-2일 소모)", attributes: AttributeContainer([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 10, weight: .light)]))
        config.titleAlignment = .center
        button.configuration = config
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    
    let generalDeliveryButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .black
        config.title = "345,000"
        config.subtitle = "일반배송(3-5일 소모)"
        config.attributedTitle = AttributedString("345,000", attributes: AttributeContainer([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 14, weight: .bold)]))
        config.attributedSubtitle = AttributedString("일반배송(3-5일 소모)", attributes: AttributeContainer([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 10, weight: .light) ]))
        config.titleAlignment = .center
        button.configuration = config
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        SetUpUI()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func SetUpUI() {
        addSubviews(sizeSButton,sizeLButton,sizeMButton,sizeXLButton,sizeXXLButton)
        addSubview(imageView)
        addSubviews(productNameLabel,productSubNameLabel)
        addSubviews(dividedLine,fastDeliveryButton,generalDeliveryButton)
      
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(61)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(91)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(61)
            make.leading.equalTo(imageView.snp.trailing).offset(15)
            make.height.equalTo(17)
        }
        
        productSubNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(imageView.snp.trailing).offset(15)
            make.height.equalTo(14)
        }
        
        sizeSButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(35)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(47)
            make.width.equalTo(110)
        }
        
        sizeMButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(35)
            make.leading.equalTo(sizeSButton.snp.trailing).offset(7)
            make.height.equalTo(47)
            make.width.equalTo(110)
        }
        sizeLButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(35)
            make.leading.equalTo(sizeMButton.snp.trailing).offset(7)
            make.height.equalTo(47)
            make.width.equalTo(110)
        }
        sizeXLButton.snp.makeConstraints { make in
            make.top.equalTo(sizeSButton.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(47)
            make.width.equalTo(110)
        }
        
        sizeXXLButton.snp.makeConstraints { make in
            make.top.equalTo(sizeMButton.snp.bottom).offset(8)
            make.leading.equalTo(sizeXLButton.snp.trailing).offset(7)
            make.height.equalTo(47)
            make.width.equalTo(110)
        }
        
        dividedLine.snp.makeConstraints{ make in
            make.top.equalTo(sizeXLButton.snp.bottom).offset(250)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        fastDeliveryButton.snp.makeConstraints{ make in
            make.top.equalTo(dividedLine.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(52)
            make.width.equalTo(168)
        }
        
        generalDeliveryButton.snp.makeConstraints{ make in
            make.top.equalTo(dividedLine.snp.bottom).offset(10)
            make.leading.equalTo(fastDeliveryButton.snp.trailing).offset(6)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
            make.width.equalTo(168)
            
        }
        
    }
    
}




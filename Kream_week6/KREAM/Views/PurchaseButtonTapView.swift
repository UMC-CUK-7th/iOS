//
//  PurchaseButtonTapView.swift
//  KREAM
//
//  Created by 서재민 on 11/8/24.
//

import UIKit

class PurchaseButtonTapView: UIView {
    //MARK: - UIComponent
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "purchaseButtonTap")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let productSubNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    let sizeSButton: UIButton = {
        let button = UIButton()
        button.setTitle("S", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    let sizeMButton: UIButton = {
        let button = UIButton()
        button.setTitle("M", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    let sizeLButton: UIButton = {
        let button = UIButton()
        button.setTitle("L", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    let sizeXLButton: UIButton = {
        let button = UIButton()
        button.setTitle("XL", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    let sizeXXLButton: UIButton = {
        let button = UIButton()
        button.setTitle("XXL", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    let fastDeliveryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Fast Delivery", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    let fastDeliveryButtonDescrpiton: UILabel = {
        let label = UILabel()
        label.text = "1,110000"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
        
    let fastDeliveryButtonSubDescrpiton: UILabel = {
        let label = UILabel()
        label.text = "빠른배송(1-2일)"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    let generalDeliveryButton: UIButton = {
        let button = UIButton()
        button.setTitle("General Delivery", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        return button
    }()
    
    
    let generalDeliveryButtonDescrpiton: UILabel = {
        let label = UILabel()
        label.text = "3110,000"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    let generalDeliveryButtonSubDescrpiton: UILabel = {
        let label = UILabel()
        label.text = "일반배송(3-5일)"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        return label
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
        
    }
    
    
}

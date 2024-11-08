//
//  ProductPurchaseView.swift
//  KREAM
//
//  Created by 서재민 on 11/5/24.
//

import UIKit
import SnapKit
class JustDroppedDetailView: UIView {
    //MARK: - UIComponent
    
    // back indicator는 뷰컨에서
    
    //메인사진
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "product")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let productColorCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 53, height:53)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero,collectionViewLayout: layout)
        view.backgroundColor = .red
        view.isScrollEnabled = true
        view.layer.borderColor = UIColor.black.cgColor
        view.register(HomeHanpaCell.self, forCellWithReuseIdentifier: HomeHanpaCell.identifier) //나중에 바꿔야함!!
        return view
    }()
    
    let buynowLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.text = "즉시 구매가"
        return label
    }()
    //가격 데이터를 받을 때 사용할 label
   
    let productPriceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.text = "10000"
        return label
    }()
    
    
    let productNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.text = "상품 이름"
        return label
    }()
    
    let productDescriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.text = "상품 한국이름"
        return label
    }()
    
    let dividedLine : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let bookmarkImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bookmark")
        return imageView
    }()
    
    let bookmarkLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.text = "2122"
        return label
    }()
    
    //구매버튼 component
    let purchaseButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    let purchaseLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.text = "구매"
        return label
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.text = "10000"
        return label
    }()
    
    let purchasesubLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.text = "즉시구매가"
        return label
    }()
    
    
    //판매버튼 UIComponent
    let sellButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    let sellLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.text =  "판매"
        return label
    }()
    
    let sellPriceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.text = "112300"
        return label
    }()
    
    let sellsubLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.text = "즉시판매가"
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
    
    private func SetUpUI(){
        addSubview(imageView)
        addSubview(productColorCollectionView)
        addSubviews(buynowLabel,productNameLabel,productPriceLabel)
        addSubview(dividedLine)
        addSubviews(bookmarkImage,bookmarkLabel,purchaseLabel,purchaseButton,purchasesubLabel,sellButton,sellLabel,sellPriceLabel,sellsubLabel)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(373)
            make.width.equalTo(373)
        }
        
        productColorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(53)
        }
        
        buynowLabel.snp.makeConstraints { make in
            make.top.equalTo(productColorCollectionView.snp.bottom).offset(23)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(14)
        }
        
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(buynowLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productPriceLabel.snp.bottom).offset(18)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(19)
        }
        
        productDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(14)
        }
        
        dividedLine.snp.makeConstraints { make in
            make.top.equalTo(productDescriptionLabel.snp.bottom).offset(14)
            make.height.equalTo(1)
        }
        
        bookmarkImage.snp.makeConstraints { make in
            make.top.equalTo(dividedLine.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(17)
            make.height.width.equalTo(26)
        }
        
        bookmarkLabel.snp.makeConstraints { make in
            make.bottom.equalTo(bookmarkImage.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(14)
        }
        
        purchaseButton.snp.makeConstraints { make in
            make.top.equalTo(dividedLine.snp.bottom).offset(8)
            make.leading.equalTo(bookmarkLabel.snp.trailing).offset(19)
            make.height.equalTo(38)
            
        }
        
        sellButton.snp.makeConstraints { make in
            make.top.equalTo(dividedLine.snp.bottom).offset(8)
            make.leading.equalTo(purchaseButton.snp.trailing).offset(6)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(38)
        }
    }

        
}


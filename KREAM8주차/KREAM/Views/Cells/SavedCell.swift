
import UIKit
import SnapKit

class SavedCell : UITableViewCell {
    // MARK: - Properties
    static let identifier = "SavedCell"
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier) //style 과 default의 차이?
            SetUpUI()
        }
        
        override func prepareForReuse() { //셀이 재사용되기 전에 초기화상태 만들기
            super.prepareForReuse()
            self.ProductImageView.image = nil
            self.ProductLabel.text = nil
            self.DescriptionLabel.text = nil
            self.PriceLabel.text = nil
        }
        
      
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    // MARK: - UIComponent
    
    
    lazy var ProductImageView : UIImageView = {
        let ProductimageView = UIImageView()
        ProductimageView.contentMode = .scaleAspectFit
        ProductimageView.layer.cornerRadius = 10
        ProductimageView.layer.borderWidth = 1
        return ProductimageView
    }()
    
    lazy var ProductLabel : UILabel = { // 상품이름
        let productLabel = UILabel()
        productLabel.textColor = .black
        productLabel.font = .systemFont(ofSize: 12)
        productLabel.numberOfLines = 1
        productLabel.textAlignment = .left
        return productLabel
    }()
    
    lazy var DescriptionLabel : UILabel = { //상품 설명
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .black
        descriptionLabel.font = .systemFont(ofSize: 9)
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textAlignment = .left
        descriptionLabel.lineBreakMode = .byTruncatingTail// 설명이 길어지면...으로 바꾸는
        return descriptionLabel
    }()
    
    lazy var BookmarkImageView : UIImageView = {
        let bookmarkImageView = UIImageView()
        bookmarkImageView.image = UIImage(named: "BookMark.png")
        bookmarkImageView.contentMode = .scaleAspectFit
        return bookmarkImageView
    }()
    
    
    lazy var PriceLabel : UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = .black
        priceLabel.font = .systemFont(ofSize: 12)
        priceLabel.numberOfLines = 1
        priceLabel.textAlignment = .left
        return priceLabel
    }()
    
    //cell 구분 선
    lazy var SeperatorView : UIView = {
        let seperatorView = UIView()
        seperatorView.backgroundColor = .lightGray
        return seperatorView
    }()
    
    //MARK: - SetUPUI
    private func SetUpUI() {
        self.contentView.addSubview(ProductLabel)
        self.contentView.addSubview(DescriptionLabel)
        self.contentView.addSubview(BookmarkImageView)
        self.contentView.addSubview(ProductImageView)
        self.contentView.addSubview(PriceLabel)
        self.contentView.addSubview(SeperatorView)
        SetUpConstraints()
    }
    
    //MARK: - SetUpConstraints
    func SetUpConstraints() {
        
        ProductImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(13)
            make.leading.equalToSuperview().inset(13)
            make.height.width.equalTo(72)
        }
        
        
        BookmarkImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(18)
            make.trailing.equalToSuperview().inset(17)
            make.width.equalTo(14)
            make.height.equalTo(18)
            
        }
            
        ProductLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(13)
            make.leading.equalTo(ProductImageView.snp.trailing).offset(13)
            make.height.equalTo(19)
        }
        
        DescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(ProductLabel.snp.bottom).offset(0)
            make.leading.equalTo(ProductImageView.snp.trailing).offset(13)
            make.trailing.equalTo(BookmarkImageView.snp.leading).offset(111)
            make.height.equalTo(33)
            }
        
       
        
        PriceLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(16)
        }
        
        // 구분선 제약을 어떻게? = 바텀에 붙인다
        SeperatorView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(1)
        }
    }
    
//MARK: - AddModel
    public func configure(model: SavedModel){
        self.ProductImageView.image = UIImage(named: model.image)
        self.ProductLabel.text = model.name
        self.PriceLabel.text = model.price
        self.DescriptionLabel.text = model.description
    }
}


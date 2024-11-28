//
//  HomeJustDroppedCell.swift
//  KREAM
//
//  Created by 서재민 on 10/31/24.
//
import SnapKit
import UIKit

//MARK: - protocol
protocol CollectionViewCellDelegate: AnyObject {
    func didTapButton(in cell: HomeJustDroppedCell)
}


class HomeJustDroppedCell: UICollectionViewCell {
    
//MARK: - Properties
    static let identifier = "HomeJustDroppedCell"
    weak var delegate: CollectionViewCellDelegate?
   
    
//MARK: -UIComponents
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let priceSubLabel: UILabel = {
        let label = UILabel()
        label.text = "즉시 구매가"
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,subTitleLabel,priceLabel, priceSubLabel])
        stackView.axis = .vertical
        return stackView
    }()
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        subTitleLabel.text = nil
        priceLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Function
    @objc private func buttonTapped(){
         delegate?.didTapButton(in: self)
     }
    
    private func setupUI() {
        self.contentView.addSubviews(imageView,labelStackView)
        self.contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(0)
            make.height.width.equalTo(142)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(0)
            make.height.width.equalTo(142)
        }//142
        
       
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(4)
            make.bottom.equalToSuperview()
            make.height.equalTo(87)
            make.width.equalTo(124)
        }//142+8+87= 150+87 =237   셀사이즈랑 같음
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(14)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.height.equalTo(28)
            
        }
        priceSubLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(12)
        }
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(priceSubLabel.snp.top).offset(-2)
            make.height.equalTo(16)
        }
    }
    
    
}

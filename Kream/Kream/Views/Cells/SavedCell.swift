//
//  SavedCell.swift
//  KREAM
//
//  Created by 류한비 on 10/20/24.
//

import UIKit
import SnapKit

class SavedCell: UITableViewCell {
    static let identifier = "SavedCell"
    
    //MARK: - TableViewCell 초기화
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse() //오버라이드, 셀이 재사용되기 전에 초기화.
        self.savedImageView.image = nil
        self.savedTitle.text = nil
        self.savedPrice.text = nil
        self.savedInfo.text = nil
    }
    
    public func configure(model: SavedModel){ //SavedModel 타입을 인자로 받아 값을 변경할 수 있도록 함
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedTitle.text = model.savedTitle
        self.savedPrice.text = model.savedPrice
        self.savedInfo.text = model.savedInfo
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){ //셀이 초기화할 때 호출되는 메소드
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Components
    // 상품 이미지
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        savedImageView.layer.cornerRadius = 10 //이미지 Radius 10
    }
    
    // 상품 타이틀
    private lazy var savedTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        title.textColor = .black
        title.numberOfLines = 0
        title.textAlignment = .left
        
        return title
    }()
    
    // 저장 버튼
    private lazy var savedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "savedButton"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    // 가격
    private lazy var savedPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .right
        
        return label
    }()
    
    // 상품 정보
    private lazy var savedInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    //MARK: - setup UI
    private func setupUI(){
        self.backgroundColor = .white
        
        self.addSubview(savedImageView)
        self.addSubview(savedTitle)
        self.addSubview(savedButton)
        self.addSubview(savedPrice)
        self.addSubview(savedInfo)
        setupConstraints()
    }
    
    //MARK: - setup Constraints
    private func setupConstraints(){
        // 상품 이미지
        savedImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().offset(13)
            $0.height.width.equalTo(72)
        }
        // 상품 타이틀
        savedTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalTo(savedImageView.snp.trailing).offset(13)
        }
        
        // 저장 버튼
        savedButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
        
        // 가격
        savedPrice.snp.makeConstraints {
            $0.top.equalTo(savedTitle.snp.bottom).offset(35)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        // 상품 정보
        savedInfo.snp.makeConstraints{
            $0.top.equalTo(savedTitle.snp.bottom).offset(5)
            $0.leading.equalTo(savedImageView.snp.trailing).offset(13)
            $0.trailing.equalToSuperview().inset(142)
            //$0.width.equalTo(153)
        }
    
    }
}

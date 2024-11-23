//
//  SearchDetailTableViewCell.swift
//  KREAM
//
//  Created by 류한비 on 11/21/24.
//

import UIKit
import SnapKit
import Then

class SearchDetailTableViewCell: UITableViewCell {
    static let identifier = "SearchDetailsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    public func configure(model: Product){
        searchTitle.text = model.title // 셀에 title 표시
    }
    
    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 검색어
    lazy var searchTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    //MARK: - setup UI
    private func setupUI(){
        self.backgroundColor = .white
        self.addSubview(searchTitle)
        setupConstraints()
    }
    
    //MARK: - setup Constraints
    private func setupConstraints(){
        // 검색어
        searchTitle.snp.makeConstraints{
            $0.verticalEdges.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(17)
        }
    }
    
    
}

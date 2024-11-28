//
//  SearchRecommendWordTableCell.swift
//  KREAM
//
//  Created by 서재민 on 11/24/24.
//

import UIKit
import SnapKit
class SearchRecommendWordTableCell: UITableViewCell {
//MARK: - Properties
   static let identifier = "searchRecommendWordTableCell"
 
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier) 
            SetUpUI()
        }
        
        override func prepareForReuse() { //셀이 재사용되기 전에 초기화상태 만들기
            super.prepareForReuse()
            self.recommendWordLabel.text = nil
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    //MARK: - UIComponents
    
    lazy var recommendWordLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left

        return label
    }()
    
    
    //MARK: - Func
    
    private func SetUpUI() {
        addSubview(recommendWordLabel)
        
        recommendWordLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.leading.equalToSuperview().inset(16)
        }
        
    }
    
    
    //MARK: - Add Model
    
    func configure(model : Product){
        self.recommendWordLabel.text = model.title
    }
}

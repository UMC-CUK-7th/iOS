//
//  SearchCollectionViewCell.swift
//  KREAM
//
//  Created by 류한비 on 11/20/24.
//

import UIKit
import SnapKit
import Then

class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"
    
    // labelContainer
    let labelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = 1
        return view
    }()

    // 추천 검색어 label
    let searchLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.5, weight: .light)
        label.text = "검색어"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup UI
    private func setupUI(){
        self.addSubview(labelContainer)
        labelContainer.addSubview(searchLabel)
        
        setupConstraints()
    }
    
    //MARK: - setup Constraints
    private func setupConstraints(){
        // labelContainer
        labelContainer.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        // 추천 검색어 label
        searchLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(11) // 패딩 설정
        }
        
    }
}

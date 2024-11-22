//
//  SearchTapView.swift
//  KREAM
//
//  Created by 서재민 on 11/20/24.
//

import UIKit
import SnapKit
class SearchTapView: UIView {

    //MARK: - UIComponents
    let searchButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemGray6
        config.titleAlignment = .leading
        button.contentHorizontalAlignment = .leading
        config.attributedTitle = AttributedString("브랜드,상품,프로필,태그 등", attributes: AttributeContainer([.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 13.5, weight: .bold)]))
        button.configuration = config
        return button
    }()
    
    let dividedLine : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray6
        return line
    }()
    
    let recommendationLabel: UILabel = {
        let label = UILabel()
        label.text = "추천 검색어"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let recommendationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 8
        collectionView.backgroundColor = .clear
        collectionView.register(RecommendLabelCell.self, forCellWithReuseIdentifier: RecommendLabelCell.identifier)
        return collectionView
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
    
    
    //MARK: - Func
    
    func SetUpUI(){
        addSubviews(searchButton,dividedLine,recommendationLabel)
        addSubviews(recommendationCollectionView)
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(8)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(52)
            make.height.equalTo(39)
        }
        
        dividedLine.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(11)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }
        
        recommendationLabel.snp.makeConstraints { make in
            make.top.equalTo(dividedLine.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(18)
        }
        
        recommendationCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendationLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(76)
            
        }
    }
    
    
}

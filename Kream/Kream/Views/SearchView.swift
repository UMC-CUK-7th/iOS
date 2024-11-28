//
//  SearchView.swift
//  KREAM
//
//  Created by 류한비 on 10/23/24.
//

import UIKit
import SnapKit
import Then

class SearchView: UIView {
    
    // 검색 TextField
    let searchTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
            string: "브랜드, 상품, 프로필, 태그 등",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        tf.backgroundColor = .systemGray6
        tf.font = .systemFont(ofSize: 13.5, weight: .regular)
        tf.layer.cornerRadius = 12
        tf.layer.masksToBounds = true
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        return tf
    }()
    
    // 취소버튼
    let cancleButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    // 구분선
    let line : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray6
        return line
    }()
    
    // 추천 검색어 UICollectionView
    let searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize // 크기 자동 조정
        $0.minimumInteritemSpacing = 8 //셀 간의 최소 간격
        $0.minimumLineSpacing = 12}).then{ //행간의 최소 간격
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        }
    
    // 추천 검색어 label
    let reLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "추천 검색어"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    

    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupUI
    private func setupUI(){
        self.backgroundColor = .white
        self.addSubview(searchTextField)
        self.addSubview(cancleButton)
        self.addSubview(line)
        self.addSubview(searchCollectionView)
        self.addSubview(reLabel)
        setupConstraints()
    }
    
    //MARK: - setupConstraints
    private func setupConstraints(){
        // 검색 TextField
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-55)
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
        
        // 취소 버튼
        cancleButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(18)
            $0.leading.equalTo(searchTextField.snp.trailing).offset(11)
            $0.height.equalTo(17)
        }
        
        // 구분선
        line.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(11)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        
        // 추천 검색어 UICollectionView
        searchCollectionView.snp.makeConstraints{
            $0.top.equalTo(searchTextField.snp.bottom).offset(70)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.height.equalTo(100)
        }
        
        // 추천 검색어 label
        reLabel.snp.makeConstraints{
            $0.top.equalTo(searchTextField.snp.bottom).offset(41)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(18)
        }
    }
}

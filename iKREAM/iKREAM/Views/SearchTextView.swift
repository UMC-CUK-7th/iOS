//
//  SearchTextView.swift
//  iKREAM
//
//  Created by 김윤진 on 11/21/24.
//

import UIKit
import SnapKit
import Then

class SearchTextView: UIView {

    lazy var search2TextField = UITextField().then {
        $0.placeholder = "브랜드,상품,프로필,태그 등"
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.layer.cornerRadius = 15
        $0.layer.backgroundColor = UIColor.systemGray6.cgColor
        $0.layer.masksToBounds = true
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        $0.leftViewMode = .always
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.returnKeyType = .done
        $0.clearsOnBeginEditing = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let cancleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .black
        $0.text = "취소"
        $0.textAlignment = .center
    }
    
    let chucheonLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
        $0.text = "추천 검색어"
        $0.textAlignment = .center
    }
    
    let chucheonCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal // 가로 방향 스크롤
        $0.minimumInteritemSpacing = 8 // 좌우 간격
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false // 스크롤 필요x
        $0.register(DroppedCollectionViewCell.self, forCellWithReuseIdentifier: DroppedCollectionViewCell.identifier)
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubviews(search2TextField, cancleLabel, chucheonLabel, chucheonCollectionView)
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupConstraints() {
        search2TextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(7)
            make.width.equalTo(303)
            make.height.equalTo(40)
        }
        
        cancleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(18)
            make.leading.equalTo(search2TextField.snp.trailing).offset(11)
        }
        
        chucheonLabel.snp.makeConstraints { make in
            make.top.equalTo(search2TextField.snp.bottom).offset(41)
            make.leading.equalToSuperview().offset(16)
        }
        
        chucheonCollectionView.snp.makeConstraints { make in
            make.top.equalTo(chucheonLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview().inset(15)
            make.width.equalTo(340)
            make.height.equalTo(78)
        }
    }
}

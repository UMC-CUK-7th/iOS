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
    }
}

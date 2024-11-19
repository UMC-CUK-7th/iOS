//
//  SearchDetailView.swift
//  KREAM
//
//  Created by 류한비 on 11/19/24.
//

import UIKit
import SnapKit
import Then

class SearchDetailView: UIView {
    
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
    
    // 뒤로가기 버튼
    let backButton: UIButton = {
        let button = UIButton()
        let backImage = UIImage(named: "backbutton")
        button.setImage(backImage, for: .normal)
        button.tintColor = .black
        return button
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
        self.addSubview(backButton)
        setupConstraints()
    }
    
    //MARK: - setupConstraints
    private func setupConstraints(){
        // 검색 TextField
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.leading.equalTo(backButton.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-55)
            $0.width.equalTo(268)
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
        
        // 뒤로가기 버튼
        backButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(14)
            $0.leading.equalToSuperview().offset(15)
            $0.height.width.equalTo(24)
        }
    }
}

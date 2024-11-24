//
//  SearchDetailView.swift
//  KREAM
//
//  Created by 서재민 on 11/22/24.
//

import UIKit
import SnapKit
class SearchDetailView: UIView {

    //MARK: - UIComponents
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.textColor = .black
        textField.textAlignment = .left
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 11))
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 13.5)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.isUserInteractionEnabled = true

        return textField
    }()
    
   let recommendWordTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
       tableView.register(SearchRecommendWordTableCell.self, forCellReuseIdentifier: SearchRecommendWordTableCell.identifier)
        
        return tableView
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
    
    private func SetUpUI() {
        addSubviews(searchTextField,recommendWordTableView)
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(8)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(52)
            make.height.equalTo(39)
        }
        
        recommendWordTableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(31)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
        
    
}

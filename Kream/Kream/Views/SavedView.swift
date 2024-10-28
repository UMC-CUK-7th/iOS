//
//  SavedView.swift
//  KREAM
//
//  Created by 류한비 on 10/20/24.
//

import UIKit
import SnapKit

class SavedView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Components
    // Saved label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0 //UILabel의 텍스트 길이에 따라 무한히 줄 추가(디폴트값 : 1)
        return label
    }()
    
    // 전체 개수 label
    let totalLabel:UILabel={
        let label = UILabel()
        label.text = "전체 \(dummySavedModel.saveDatas.count)개" //데이터를 불러와 동적으로 개수 반영
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, totalLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally //서브뷰 고유 크기에 따라 비례해서 크기 조정
        stackView.spacing = 16 //titleLabel과 totalLabel의 간격
        stackView.alignment = .leading
        return stackView
    }()
    
    // 테이블 뷰
    public lazy var savedTableView: UITableView = { //SaveCell을 불러와 테이블 뷰를 넣어줌
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    
    //MARK: - setup UI
    private func setupUI(){
        self.backgroundColor = .white
        self.addSubview(titleStackView)
        self.addSubview(savedTableView)
        setupConstraints()
    }
    //MARK: - setup Constraints
    private func setupConstraints(){
        // 타이틀 스택뷰
        titleStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(61)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(22 + 16 + 45) //titleLabel과 totalLabel 각각의 height와 간격을 더함
        }
        
        // 테이블 뷰
        savedTableView.snp.makeConstraints{
            $0.top.equalTo(titleStackView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

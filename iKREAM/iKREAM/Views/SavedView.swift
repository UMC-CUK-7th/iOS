//
//  SavedView.swift
//  iKREAM
//
//  Created by 김윤진 on 10/19/24.
//
import UIKit

class SavedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var ttl: UILabel = {
        let label = UILabel()
        label.text = "전체 0개"  // 초기값 설정, 이후에 동적으로 수정됨
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    private func setViews() {
        self.addSubview(title)
        self.addSubview(ttl)
        self.addSubview(tableView)
    }
    
    private func setConstaints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-302)
        }
        
        ttl.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(13)
            $0.right.equalToSuperview().offset(-305)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(ttl.snp.bottom).offset(20)  // ttl 라벨 아래에 테이블 뷰 위치
            $0.left.right.bottom.equalToSuperview()
        }
    }
}

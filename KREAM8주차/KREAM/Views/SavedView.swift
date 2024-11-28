//
//  Saved.swift
//  KREAM
//
//  Created by 서재민 on 10/20/24.
//
import UIKit
import SnapKit

class SavedView: UIView {
    // MARK: - UI Component
    
    let SavedLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = .systemFont(ofSize:28, weight: .regular)
        label.textColor = .black
        return label
    }()
    
   
    let CountLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 10개"
        label.font = .systemFont(ofSize:14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    lazy var SavedTableView = UITableView()

    
    
    
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        SetUpUI()
        
     }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetUpUI(){
        self.backgroundColor = .white
        self.addSubview(SavedLabel)
        self.addSubview(SavedTableView)
        self.addSubview(CountLabel)
        SavedLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(13)
            make.height.equalTo(45)
        }
        
        CountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(76)
            make.leading.equalToSuperview().offset(13)
        }
        
        SavedTableView.snp.makeConstraints { make in
            make.top.equalTo(SavedLabel.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

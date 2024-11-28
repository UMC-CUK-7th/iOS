//
//  DeepSearchView.swift
//  iKREAM
//
//  Created by 김윤진 on 11/21/24.
//

import UIKit
import SnapKit
import Then

class DeepSearchView: UIView {

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
    
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubviews(search2TextField, cancleLabel)
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
            make.leading.equalToSuperview().offset(54)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(7)
            make.width.equalTo(268)
            make.height.equalTo(39)
        }
        
        cancleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(18)
            make.leading.equalTo(search2TextField.snp.trailing).offset(11)
        }
    }

}

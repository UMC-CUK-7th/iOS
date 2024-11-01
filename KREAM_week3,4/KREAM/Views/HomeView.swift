//
//  HomeView.swift
//  KREAM
//
//  Created by 서재민 on 10/23/24.
//

import UIKit
import SnapKit

class HomeView: UIView {
        
    //MARK: - UIComponents
    
    lazy var SegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["추천", "랭킹", "발매정보","남성","여성"])
      /*
        control.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        control.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
       주석 풀면 세그컨트롤이 스크린에 안떠요
        */
        control.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 15, weight: .medium)
            ], for: .normal)
        control.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 15, weight: .bold)
        ], for: .selected)
        
        control.selectedSegmentIndex = 0
        return control
    }()
    
    let HomeCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 61, height:81)
        layout.minimumInteritemSpacing = 9
        
        let view = UICollectionView(frame: .zero,collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.isScrollEnabled = false
        view.layer.borderColor = UIColor.black.cgColor
        view.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        return view
    }()
    
    
    lazy var SearchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.borderStyle = .none
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        return textField
    }()
    
    
    
    let Zongimage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Zong")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    let HomeAD: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "HomeAD")
        imageView.translatesAutoresizingMaskIntoConstraints = false
                return imageView
    }()
    
    let Emptylabel: UILabel = {
        let label = UILabel()
        label.text = "비었음."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
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
    
    //MARK: - Constraints
    func SetUpUI(){
        addSubview(SearchTextField)
        addSubview(SegmentedControl)
        addSubview(Zongimage)
        addSubview(HomeAD)
        addSubview(HomeCollectionView)
        Zongimage.snp.makeConstraints{ make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(14)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }
        
        
        SearchTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(6)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalTo(Zongimage.snp.leading).offset(-16)
            make.height.equalTo(40)
        }
        
        SegmentedControl.snp.makeConstraints{ make in
            make.top.equalTo(SearchTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    
        HomeAD.snp.makeConstraints{ make in
            make.top.equalTo(SegmentedControl.snp.bottom).offset(0)
            make.leading.equalToSuperview().inset(0)
            make.trailing.equalToSuperview().inset(0)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(300)
        }
      
        HomeCollectionView.snp.makeConstraints{ make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(30)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(182)
        }
        }
    
    
    }
    




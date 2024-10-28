//
//  HomeView.swift
//  KREAM
//
//  Created by 류한비 on 10/22/24.
//

import UIKit
import SnapKit
import Then

class HomeView: UIView {
    
    // 검색 TextField
    let searchTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "브랜드, 상품, 프로필, 태그 등"
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
    
    // 알림 버튼
    let alarmButton: UIButton = {
        let ab = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "alarm")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        ab.configuration = configuration
        return ab
    }()
    
    // UISegmentedControl
    let homeSegmentControl = UISegmentedControl(items:["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then{
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.apportionsSegmentWidthsByContent = true
        
        $0.setTitleTextAttributes( //세그먼트의 텍스트
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal //선택되지 않았을 때
        )
        $0.setTitleTextAttributes( // 세그먼트를 선택했을 때 텍스트가 굵어지도록 함
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected //선택 했을 때
        )
    }
    
    
    // 중앙 이미지
    let centerImage: UIImageView = {
        let ci = UIImageView()
        ci.image = UIImage(named: "centerImage")
        ci.contentMode = .scaleAspectFill
        return ci
    }()
    
    
    // UICollectionView
    let homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81) //각 셀의 사이즈
        $0.minimumInteritemSpacing = 9 //셀 간의 최소 간격
        $0.minimumLineSpacing = 20}).then{ //행간의 최소 간격
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false //스크롤 가능 여부
        $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - setup UI
    private func setupUI() {
        self.addSubview(searchTextField)
        self.addSubview(alarmButton)
        self.addSubview(homeSegmentControl)
        self.addSubview(homeCollectionView)
        self.addSubview(centerImage)
        
        setupConstraints()
    }
    
    //MARK: - setup Constraints
    private func setupConstraints() {
        // 검색 TextField
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-55)
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
        
        // 알림 버튼
        alarmButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(14)
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.equalTo(searchTextField.snp.trailing).offset(15)
            $0.height.width.equalTo(24)
        }
        
        // UISegmentedControl
        homeSegmentControl.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(8)
            //$0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(27)
        }
        
        // 중앙 이미지
        centerImage.snp.makeConstraints {
            $0.top.equalTo(homeSegmentControl.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(336)
            $0.width.equalTo(374)
        }
        
        // UICollectionView
        homeCollectionView.snp.makeConstraints{
            $0.top.equalTo(centerImage.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(48)
        }
        
        
    }
}

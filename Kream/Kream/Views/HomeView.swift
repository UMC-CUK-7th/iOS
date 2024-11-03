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
    // scrollView
    private lazy var homeScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    // contentView
    let contentView: UIView = {
        let contentView = UIView()
        
        return contentView
    }()
    
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
    
    // 구분선
    let line : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray6
        return line
    }()
    
    // Just Dropped
    let justDroppedLabel: UILabel = {
        let label = UILabel()
        label.text = "Just Dropped"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    // 발매 상품
    let infoLabel1: UILabel = {
        let label = UILabel()
        label.text = "발매 상품"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    // 발매 상품 UICollectionView
    let productCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 142, height: 237) //각 셀의 사이즈
        $0.minimumInteritemSpacing = 8 //셀 간의 최소 간격
        $0.scrollDirection = .horizontal}).then{
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true //스크롤 가능 여부
            $0.showsHorizontalScrollIndicator = false // 가로 스크롤바 숨김
            $0.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    
    // 구분선2
    let line2 : UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray6
        return line
    }()
    
    // 본격 한파대비! 연말 필수템 모음
    let infoLabel2: UILabel = {
        let label = UILabel()
        label.text = "본격 한파대비! 연말 필수템 모음"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
                
    // #해피홀리룩챌린지
    let infoLabel3: UILabel = {
        let label = UILabel()
        label.text = "#해피홀리룩챌린지"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    // ChallengeUICollectionView
    let challengeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 124, height: 165) //각 셀의 사이즈
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal }).then{
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true //스크롤 가능 여부
            $0.showsHorizontalScrollIndicator = false // 가로 스크롤바 숨김
            $0.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
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
        self.addSubview(homeScrollView)
        homeScrollView.addSubview(contentView)
        self.addSubview(searchTextField)
        self.addSubview(alarmButton)
        self.addSubview(homeSegmentControl)
        contentView.addSubview(homeCollectionView)
        contentView.addSubview(centerImage)
        contentView.addSubview(line)
        contentView.addSubview(justDroppedLabel)
        contentView.addSubview(infoLabel1)
        contentView.addSubview(productCollectionView)
        contentView.addSubview(line2)
        contentView.addSubview(infoLabel2)
        contentView.addSubview(infoLabel3)
        contentView.addSubview(challengeCollectionView)
        
        setupConstraints()
    }
    
    //MARK: - setup Constraints
    private func setupConstraints() {
        // scrollView
        homeScrollView.snp.makeConstraints {
            $0.top.equalTo(homeSegmentControl.snp.bottom) //scrollView를 segmentControl 아래에 걸음
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        // contentView
        contentView.snp.makeConstraints {
            $0.edges.equalTo(homeScrollView)
            $0.width.equalTo(homeScrollView.snp.width)
            $0.height.equalTo(1200)
        }
        
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
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(27)
        }
        
        // 중앙 이미지
        centerImage.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(336)
            $0.width.equalTo(374)
        }
        
        // UICollectionView
        homeCollectionView.snp.makeConstraints{
            $0.top.equalTo(centerImage.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(48)
        }
        
        // 구분선
        line.snp.makeConstraints {
            $0.top.equalTo(centerImage.snp.bottom).offset(232)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        
        // Just Dropped
        justDroppedLabel.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(19)
        }
        
        // 발매 상품
        infoLabel1.snp.makeConstraints{
            $0.top.equalTo(justDroppedLabel.snp.bottom).offset(4)
            $0.leading.equalTo(justDroppedLabel)
            $0.height.equalTo(16)
        }
        
        // 발매 상품 UICollectionView
        productCollectionView.snp.makeConstraints{
            $0.top.equalTo(infoLabel1.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(237)
            $0.width.equalTo(1000)
        }
        
        // 구분선2
        line2.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(340)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
        
        // 본격 한파대비! 연말 필수템 모음
        infoLabel2.snp.makeConstraints {
            $0.top.equalTo(line2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(19)
        }
        
        // #해피홀리룩챌린지
        infoLabel3.snp.makeConstraints{
            $0.top.equalTo(infoLabel2.snp.bottom).offset(4)
            $0.leading.equalTo(infoLabel2)
            $0.height.equalTo(16)
        }
        
        // ChallengeUICollectionView
        challengeCollectionView.snp.makeConstraints{
            $0.top.equalTo(infoLabel3.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(165)
            $0.width.equalTo(1000)
        }
    }
}
#Preview {
    HomeView()
}

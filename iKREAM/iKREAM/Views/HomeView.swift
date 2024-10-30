//  HomeView.swift
//  iKREAM
//
//  Created by 김윤진 on 10/21/24.
//

import UIKit
import SnapKit
import Then

class HomeView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView = UIView()
    
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.apportionsSegmentWidthsByContent = true
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 15, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 15, weight: .bold)
            ],
            for: .selected
        )
    }
    
    // 밑줄을 위한 뷰
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let recommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical // 수직 방향 스크롤
        $0.minimumInteritemSpacing = 9 // 좌우 간격 설정
        $0.minimumLineSpacing = 20 // 위아래 간격 설정
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    let droppedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal // 가로 방향 스크롤
        $0.minimumInteritemSpacing = 8 // 좌우 간격
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true // 스크롤을 가능하도록 설정
        $0.register(DroppedCollectionViewCell.self, forCellWithReuseIdentifier: DroppedCollectionViewCell.identifier)
    }
    
    let winterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal // 가로 방향 스크롤
        $0.minimumInteritemSpacing = 8 // 좌우 간격
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true // 스크롤을 가능하도록 설정
        $0.register(WinterCollectionViewCell.self, forCellWithReuseIdentifier: WinterCollectionViewCell.identifier)
    }
    
    let emptyLable = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .black
        $0.text = "휑~"
        $0.isHidden = true
    }
    
    let bannerImageView: UIImageView = {
        let bv = UIImageView()
        bv.image = UIImage(named: "banner")
        bv.contentMode = .scaleAspectFill
        return bv
    }()
    
    //MARK: UISegmentedControl
    let bellButton: UIButton = {
        let bll = UIButton()
        bll.setImage(UIImage(systemName: "bell"), for: .normal)
        bll.tintColor = .black
        return bll
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드,상품,프로필,태그 등" // 플레이스홀더 : 문구를 입력하기전에 보여주는 문구
        textField.font = .systemFont(ofSize: 13, weight: .regular)
        textField.layer.cornerRadius = 15 // 둥글게
        //textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.layer.masksToBounds = true // 콘텐츠가 레이어의 경게를 넘으면, 그 부분을 자를건지 묻는 여부 코드 (참)
        let leftview = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16)) // 왼쪽에 공백 주는 코드
        textField.leftView = leftview
        textField.leftViewMode = .always
        
        textField.autocapitalizationType = .none // 첫 글자 대문자 (자동) 끄는 코드
        textField.autocorrectionType = .no // 추천글자 표시 끄는 코드
        textField.spellCheckingType = .no // 오타글자 표시 끄는 코드
        textField.returnKeyType = .done
        textField.clearsOnBeginEditing = false // 텍스트 필드 편집 시, 기존 값 제거 ( 기본이 false )
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let droppedLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .black
        $0.text = "Just Dropped"
        $0.textAlignment = .center
        $0.isHidden = false // 필요에 따라 설정
    }
    
    let releaseLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .light)
        $0.textColor = .lightGray
        $0.text = "발매 상품"
        $0.textAlignment = .center
        $0.isHidden = false // 필요에 따라 설정
    }
    
    let winterLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .black
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.textAlignment = .center
        $0.isHidden = false // 필요에 따라 설정
    }
    
    let challengeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .light)
        $0.textColor = .lightGray
        $0.text = "#해피홀리룩챌린지"
        $0.textAlignment = .center
        $0.isHidden = false // 필요에 따라 설정
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(searchTextField)
        contentView.addSubview(bellButton)
        contentView.addSubview(segmentedControl)
        contentView.addSubview(underLineView)
        contentView.addSubview(emptyLable)
        contentView.addSubview(bannerImageView)
        contentView.addSubview(recommendCollectionView)
        contentView.addSubview(droppedLabel)
        contentView.addSubview(releaseLabel)
        contentView.addSubview(droppedCollectionView)
        contentView.addSubview(winterLabel)
        contentView.addSubview(challengeLabel)
        contentView.addSubview(winterCollectionView)
        
        setupConstraints()
        setupSegmentedControlAction()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupConstraints
    private func setupConstraints() {
        // ScrollView와 containerView 제약 설정
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
            make.bottom.equalTo(winterCollectionView.snp.bottom).offset(20)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(contentView.snp.top).offset(6)
            make.width.equalTo(303)
            make.height.equalTo(40)
        }
        
        bellButton.snp.makeConstraints { make in
            make.leading.equalTo(searchTextField.snp.trailing).offset(16)
            make.top.equalTo(contentView.snp.top).offset(6)
            make.width.height.equalTo(24)
            
        }
        segmentedControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(searchTextField.snp.bottom).offset(16)
            make.width.equalTo(325)
            make.height.equalTo(27)
        }
        // 밑줄의 초기 위치 및 크기 설정
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(5)
            make.width.equalTo(28)
            make.height.equalTo(2) // 밑줄의 두께 설정
            make.leading.equalTo(segmentedControl.snp.leading) // 첫 번째 세그먼트 아래로 위치
        }
        emptyLable.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(336)
        }
        recommendCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(18)
            make.top.equalTo(bannerImageView.snp.bottom).offset(20)
            make.width.equalTo(344)
            make.height.equalTo(182)
        }
        droppedLabel.snp.makeConstraints { make in
            make.top.equalTo(recommendCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        releaseLabel.snp.makeConstraints { make in
            make.top.equalTo(droppedLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(16)
            //make.bottom.equalToSuperview().offset(-20)
        }
        droppedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(releaseLabel.snp.bottom).offset(14)
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(444)
            make.height.equalTo(244)
            //make.bottom.equalToSuperview().offset(-20)
        }
        winterLabel.snp.makeConstraints { make in
            make.top.equalTo(droppedCollectionView.snp.bottom).offset(50)
            make.leading.equalToSuperview().inset(16)
        }
        challengeLabel.snp.makeConstraints { make in
            make.top.equalTo(winterLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(16)
        }
        winterCollectionView.snp.makeConstraints { make in
            make.top.equalTo(challengeLabel.snp.bottom).offset(14)
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(388)
            make.height.equalTo(168)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private func setupSegmentedControlAction() {
        // 세그먼트 변경 액션 추가
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let leadingOffset = CGFloat(sender.selectedSegmentIndex) * segmentWidth
        
        UIView.animate(withDuration: 0.3) {
            self.underLineView.snp.updateConstraints { make in
                make.leading.equalTo(self.segmentedControl.snp.leading).offset(leadingOffset)
            }
            self.layoutIfNeeded()
        }
        //각 세그먼트 별 눌렀을때
        if sender.selectedSegmentIndex == 0 {
            emptyLable.isHidden = true
            bannerImageView.isHidden = false
            recommendCollectionView.isHidden = false
        } else {
            emptyLable.isHidden = false
            bannerImageView.isHidden = true
            recommendCollectionView.isHidden = true
        }
    }
}

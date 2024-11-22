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
    
    let SegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["추천", "랭킹", "발매정보","럭셔리","남성","여성"])
        control.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        control.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
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
    
    
    //MARK: - PreviousViewSetUp
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
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
    
    
    let searchButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemGray6
        config.attributedTitle = AttributedString("브랜드,상품,프로필,태그 등", attributes: AttributeContainer([.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 13.5, weight: .bold) ]))
        button.contentHorizontalAlignment = .leading 
        button.configuration = config
        return button
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
    
    
    private let DivideLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    //MARK: - LastView SetUp
    
    
    let justDroppedLabel1: UILabel = {
        let label = UILabel()
        label.text = "Just Dropped"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16,weight: .bold)
        return label
    }()
    
    let justDroppedLabel2: UILabel = {
        let label = UILabel()
        label.text = "발매상품"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14,weight: .medium)
        return label
    }()
    
    // JustDroppedCollection
    let justDroppedCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 142, height:237)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero,collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.isScrollEnabled = true
        view.layer.borderColor = UIColor.black.cgColor
        view.register(HomeJustDroppedCell.self, forCellWithReuseIdentifier: HomeJustDroppedCell.identifier)
        return view
    }()
    
    let divideLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    // 한파대비
    let hanpaLabel: UILabel = {
        let label = UILabel()
        label.text = "본격 한파대비! 연말 필수템 모음"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16,weight: .bold)
        return label
    }()
    
    let hanpaSubLabel: UILabel = {
        let label = UILabel()
        label.text = "#해피홀리룩챌린지"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14,weight: .medium)
        return label
    }()
    
    
    let homeHanpaCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .init(width: 124, height:165)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero,collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.isScrollEnabled = true
        view.layer.borderColor = UIColor.black.cgColor
        view.register(HomeHanpaCell.self, forCellWithReuseIdentifier: HomeHanpaCell.identifier)
        return view
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
    func SetUpUI() {
        addSubview(searchButton)
        addSubview(Zongimage)
        addSubview(scrollView)
        
        scrollView.addSubviews(SegmentedControl, HomeAD, HomeCollectionView, DivideLine, justDroppedLabel1,justDroppedLabel2,divideLine,justDroppedCollectionView, hanpaLabel,hanpaSubLabel,homeHanpaCollectionView)
        
      
        Zongimage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(14)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }
        
      
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(6)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalTo(Zongimage.snp.leading).offset(-16)
            make.height.equalTo(40)
        }
        
        // scrollView layout
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        

        SegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(27)
        }
        
     //MARK: - PreviousViewConstraints
        HomeAD.snp.makeConstraints { make in
            make.top.equalTo(SegmentedControl.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(0)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(300)
        }
        
        HomeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(HomeAD.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(200) 
        }
        
     
        DivideLine.snp.makeConstraints { make in
            make.top.equalTo(HomeCollectionView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
//MARK: - LastViewConstraints
      
        justDroppedLabel1.snp.makeConstraints { make in
            make.top.equalTo(DivideLine.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            
        }
        
        justDroppedLabel2.snp.makeConstraints { make in
            make.top.equalTo(justDroppedLabel1.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
        }
        
        justDroppedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(justDroppedLabel2.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(237)
        }
        
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(justDroppedCollectionView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        hanpaLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
        }
        
        hanpaSubLabel.snp.makeConstraints { make in
            make.top.equalTo(hanpaLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().inset(16)
        }
        homeHanpaCollectionView.snp.makeConstraints { make in
            make.top.equalTo(hanpaSubLabel.snp.bottom).offset(14)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(scrollView.contentLayoutGuide).offset(-30)
            make.height.equalTo(165)
        }
    }
}  


//
//  HomeViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 10/21/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    private let homeView = HomeView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAction()
        setupDelegate()
        setupSearchTextFieldTapGesture()
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate() {
        homeView.recommendCollectionView.dataSource = self
        homeView.recommendCollectionView.delegate = self
        homeView.droppedCollectionView.dataSource = self // 드롭된 컬렉션 뷰 데이터 소스 설정
        homeView.droppedCollectionView.delegate = self // 드롭된 컬렉션 뷰 델리게이트 설정
        homeView.winterCollectionView.dataSource = self
        homeView.winterCollectionView.delegate = self
    }

    // 검색창 탭 제스처 설정
    private func setupSearchTextFieldTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchTextFieldTapped))
        homeView.searchTextField.addGestureRecognizer(tapGesture)
        homeView.searchTextField.isUserInteractionEnabled = true // 사용자 상호작용 활성화
    }
    
    @objc
    private func searchTextFieldTapped() {
        // SearchViewController로 전환
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.recommendCollectionView.isHidden = false
            homeView.emptyLable.isHidden = true
            homeView.droppedCollectionView.isHidden = true // 드롭된 컬렉션 뷰 숨김
            homeView.winterCollectionView.isHidden = true
        } else {
            homeView.recommendCollectionView.isHidden = true
            homeView.emptyLable.isHidden = false
            homeView.droppedCollectionView.isHidden = false // 드롭된 컬렉션 뷰 보이기
            homeView.winterCollectionView.isHidden = false
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.recommendCollectionView {
            return HomeModel.dummy().count
        } else if collectionView == homeView.droppedCollectionView { // 드롭된 컬렉션 뷰 아이템 수 반환
            return DroppedModel.dummy().count
        } else if collectionView == homeView.winterCollectionView { // Winter 컬렉션 뷰 아이템 수 반환
            return WinterModel.dummy().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.recommendCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCollectionViewCell.identifier,
                for: indexPath
            ) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.dummy()
            cell.imageView.image = list[indexPath.row].homemodelImage
            cell.titleLabel.text = list[indexPath.row].homemodelName
            
            return cell
        } else if collectionView == homeView.droppedCollectionView { // 드롭된 셀 구성
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DroppedCollectionViewCell.identifier,
                for: indexPath
            ) as? DroppedCollectionViewCell else {
                return UICollectionViewCell()
            }
            let droppedList = DroppedModel.dummy()
            let droppedItem = droppedList[indexPath.row]
            cell.imageView.image = droppedItem.droppedImage // 첫 번째 이미지
            cell.bottomRightImageView.image = droppedItem.droppedImage2 // 두 번째 이미지
            cell.cornerTextLabel.text = droppedItem.droppedtrade // 거래 정보
            cell.titleLabel.text = droppedItem.droppedName // 이름
            cell.descriptionLabel.text = droppedItem.droppedDetail // 상세 정보
            cell.priceLabel.text = droppedItem.droppedPrice // 가격
            cell.availableLabel.text = droppedItem.droppedbuy // 구매 정보
            
            return cell
        } else if collectionView == homeView.winterCollectionView { // Winter 셀 구성
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WinterCollectionViewCell.identifier,
                for: indexPath
            ) as? WinterCollectionViewCell else {
                return UICollectionViewCell()
            }
            let winterList = WinterModel.dummy()
            let winterItem = winterList[indexPath.row]
            cell.imageView.image = winterItem.wintermodelImage
            cell.idLabel.text = winterItem.wintermodelName
            
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    // 컬렉션 뷰의 셀 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == homeView.recommendCollectionView {
            return CGSize(width: 61, height: 81)
        } else if collectionView == homeView.droppedCollectionView {
            return CGSize(width: 142, height: 244)
        } else if collectionView == homeView.winterCollectionView {
            return CGSize(width: 126, height: 168)
        }
        return CGSize.zero
    }
    
    // 컬렉션 뷰의 최소 행 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == homeView.recommendCollectionView {
            return 20
        } else if collectionView == homeView.droppedCollectionView {
            return 9 // 드롭된 컬렉션 뷰 간격
        } else if collectionView == homeView.winterCollectionView {
            return 9
        }
        return 0
    }
    
    // 컬렉션 뷰의 최소 항목 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == homeView.recommendCollectionView {
            return 9
        } else if collectionView == homeView.droppedCollectionView {
            return 9 // 드롭된 컬렉션 뷰 항목 간격
        } else if collectionView == homeView.winterCollectionView {
            return 9 // Winter 컬렉션 뷰 항목 간격
        }
        return 0
    }
    
    // 섹션 수 설정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

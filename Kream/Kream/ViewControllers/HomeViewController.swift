//
//  HomeViewController.swift
//  KREAM
//
//  Created by 류한비 on 10/22/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.homeCollectionView.dataSource = self // 데이터 바인딩
        view.productCollectionView.dataSource = self
        view.challengeCollectionView.dataSource = self
        
        return view
    }()
    
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControlAction()
        searchTextFieldAction()
    }
    
    // search 텍스트 필드 액션 연결
    private func searchTextFieldAction() {
        homeView.searchTextField.addTarget(self, action: #selector (textfieldDidTap), for: .editingDidBegin)
    }
    
    // search 텍스트 필드 클릭시 화면 전환
    @objc
    private func textfieldDidTap() {
        let td = SearchViewController()
        td.modalPresentationStyle = .fullScreen
        present(td, animated: true)
    }
    
    // segmentControl 액션
    private func segmentControlAction() {
        homeView.homeSegmentControl.addTarget(
            self,
            action: #selector(segmentControlValueChanged(segment:)), //매개변수로 segment 받아서 어떤 컴포넌트가 표시될지 분기처리
            for: .valueChanged // segment의 인덱스가 바뀌었을 때 실행됨을 의미
        )
    }
    
    // segment 인덱스가 바뀌었을 때 실행될 메소드
    @objc
    private func segmentControlValueChanged(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            homeView.centerImage.isHidden = false
            homeView.homeCollectionView.isHidden = false
            homeView.contentView.isHidden = false
        default:
            homeView.centerImage.isHidden = true
            homeView.homeCollectionView.isHidden = true
            homeView.contentView.isHidden = true
        }
    }
    
}

// MARK: - UICollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.homeCollectionView {  // homeCollectionView는 HomeModel의 더미데이터
            return HomeModel.dummy().count
        } else if collectionView == homeView.productCollectionView { // productCollectionView는 ProductModel의 더미데이터
            return ProductModel.dummy().count
        } else if collectionView == homeView.challengeCollectionView {
            return ChallengeModel.dummy().count
        }
        return 0
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // homeCollectionView
        if collectionView == homeView.homeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCollectionViewCell.identifier,
                for: indexPath
            ) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = HomeModel.dummy()
            cell.collectionImage.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].name
            return cell
            
        // productCollectionView
        } else if collectionView == homeView.productCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCollectionViewCell.identifier,
                for: indexPath
            ) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = ProductModel.dummy()
            cell.productImage.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].name
            cell.infoLabel.text = list[indexPath.row].info
            cell.priceLabel.text = list[indexPath.row].price
            cell.countLabel.text = list[indexPath.row].label
            return cell
            
        // challengeCollectionView
        } else if collectionView == homeView.challengeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ChallengeCollectionViewCell.identifier,
                for: indexPath
            ) as? ChallengeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let list = ChallengeModel.dummy()
            cell.productImage.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].name
            return cell
        }
        
        return UICollectionViewCell()
    }
}


//#Preview {
//    HomeViewController()
//}

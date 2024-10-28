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
        case 1:
            homeView.centerImage.isHidden = true
            homeView.homeCollectionView.isHidden = true
        case 2:
            homeView.centerImage.isHidden = true
            homeView.homeCollectionView.isHidden = true
        case 3:
            homeView.centerImage.isHidden = true
            homeView.homeCollectionView.isHidden = true
        case 4:
            homeView.centerImage.isHidden = true
            homeView.homeCollectionView.isHidden = true
        case 5:
            homeView.centerImage.isHidden = true
            homeView.homeCollectionView.isHidden = true
        default:
            break
        }
    }
    
}

// MARK: - UITableView DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeModel.dummy().count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    }
    
}



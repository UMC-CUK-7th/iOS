//
//  HomeViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 10/21/24.
//

import UIKit
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let homeView = HomeView() // HomeView 인스턴스 생성
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = homeView  // 인스턴스를 할당
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        
        setupAction()
        setupDelegate()
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
        homeView.recommendCollectionView.delegate = self  // 델리게이트 추가
    }
    
    @objc
        private func segmentedControlValueChanged(segment: UISegmentedControl) {
            if segment.selectedSegmentIndex == 0 {
                homeView.recommendCollectionView.isHidden = false
                homeView.emptyLable.isHidden = true
            }
            else {
                homeView.recommendCollectionView.isHidden = true
                homeView.emptyLable.isHidden = false
            }
        }
    
}

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
                
        cell.imageView.image = list[indexPath.row].homemodelImage
        cell.titleLabel.text = list[indexPath.row].homemodelName
        
            return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    // 셀 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 61, height: 81) // 셀 크기 설정
    }
    
    // 셀 간 위아래 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 // 위아래 간격
    }
    
    // 셀 간 좌우 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9 // 좌우 간격
    }

    // 섹션 수 설정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // 2섹션
    }
}


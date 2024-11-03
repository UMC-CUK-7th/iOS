//
//  HomeViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 10/21/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout {
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
        homeView.droppedCollectionView.dataSource = self
        homeView.droppedCollectionView.delegate = self
        homeView.winterCollectionView.dataSource = self
        homeView.winterCollectionView.delegate = self
    }
    
    private func setupSearchTextFieldTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchTextFieldTapped))
        homeView.searchTextField.addGestureRecognizer(tapGesture)
        homeView.searchTextField.isUserInteractionEnabled = true
    }
    
    @objc private func searchTextFieldTapped() {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    @objc private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.recommendCollectionView.isHidden = false
            homeView.emptyLable.isHidden = true
            homeView.droppedCollectionView.isHidden = true
            homeView.winterCollectionView.isHidden = true
        } else {
            homeView.recommendCollectionView.isHidden = true
            homeView.emptyLable.isHidden = false
            homeView.droppedCollectionView.isHidden = false
            homeView.winterCollectionView.isHidden = false
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.recommendCollectionView {
            return HomeModel.dummy().count
        } else if collectionView == homeView.droppedCollectionView {
            return DroppedModel.dummy().count
        } else if collectionView == homeView.winterCollectionView {
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
            let model = HomeModel.dummy()[indexPath.row]
            cell.configure(with: model)
            return cell
        } else if collectionView == homeView.droppedCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DroppedCollectionViewCell.identifier,
                for: indexPath
            ) as? DroppedCollectionViewCell else {
                return UICollectionViewCell()
            }
            let model = DroppedModel.dummy()[indexPath.row]
            cell.configure(with: model)
            return cell
        } else if collectionView == homeView.winterCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WinterCollectionViewCell.identifier,
                for: indexPath
            ) as? WinterCollectionViewCell else {
                return UICollectionViewCell()
            }
            let model = WinterModel.dummy()[indexPath.row]
            cell.configure(with: model)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout , 위에 선언 추가해서 여기엔 할 필요 x.
extension HomeViewController {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == homeView.recommendCollectionView {
            return 20
        } else if collectionView == homeView.droppedCollectionView {
            return 9
        } else if collectionView == homeView.winterCollectionView {
            return 9
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == homeView.recommendCollectionView {
            return 9
        } else if collectionView == homeView.droppedCollectionView {
            return 9
        } else if collectionView == homeView.winterCollectionView {
            return 9
        }
        return 0
    }
}

// MARK: - collectionView : Configure func.ver
extension HomeCollectionViewCell {
    func configure(with model: HomeModel) {
        imageView.image = model.homemodelImage
        titleLabel.text = model.homemodelName
    }
}

extension DroppedCollectionViewCell {
    func configure(with model: DroppedModel) {
        imageView.image = model.droppedImage
        bottomRightImageView.image = model.droppedImage2
        cornerTextLabel.text = model.droppedtrade
        titleLabel.text = model.droppedName
        descriptionLabel.text = model.droppedDetail
        priceLabel.text = model.droppedPrice
        availableLabel.text = model.droppedbuy
    }
}

extension WinterCollectionViewCell {
    func configure(with model: WinterModel) {
        imageView.image = model.wintermodelImage
        idLabel.text = model.wintermodelName
    }
}

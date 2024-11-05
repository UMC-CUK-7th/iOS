//
//  SearchViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 10/30/24.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    private let searchView = SearchView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = searchView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 뒤로가기 버튼 커스텀
        let backButtonImage = UIImage(named: "backImage 1")?.withRenderingMode(.alwaysOriginal)
        let resizedBackButtonImage = resizeImage(image: backButtonImage, targetSize: CGSize(width: 24, height: 24))
        
        let backButton = UIBarButtonItem(image: resizedBackButtonImage, style: .done, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .black // 아이콘 색상 설정

        // 현재 뷰 컨트롤러의 네비게이션 아이템에 커스텀 버튼 설정
        navigationItem.leftBarButtonItem = backButton
        setupDelegate()
    }
    
    private func setupDelegate() {
        searchView.matinCollectionView.dataSource = self
        searchView.matinCollectionView.delegate = self
    }
    
    // 뒤로가기 버튼을 눌렀을 때 동작
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // 이미지를 특정 크기로 리사이즈하는 함수
    private func resizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else { return nil }
        
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = CGSize(width: size.width * widthRatio, height: size.height * heightRatio)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 올바른 CollectionView 참조
        if collectionView == searchView.matinCollectionView {
            return SearchModel.dummy().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 올바른 CollectionView 참조
        if collectionView == searchView.matinCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: matinCollectionViewCell.identifier,
                for: indexPath
            ) as? matinCollectionViewCell else {
                return UICollectionViewCell()
            }
            let model = SearchModel.dummy()[indexPath.row] // SearchModel로 데이터 모델을 수정
            cell.configure(with: model)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == searchView.matinCollectionView {
            return CGSize(width: 53, height: 53)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == searchView.matinCollectionView {
            return 8
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == searchView.matinCollectionView {
            return 9
        }
        return 0
    }
}

// MARK: - collectionView : Configure func.ver
extension matinCollectionViewCell {
    func configure(with model: SearchModel) {
        matinView.image = model.searchImage
    }
}

//
//  SearchViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 10/30/24.
//

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

        configureNavigationBar()
        configureButtons()
        setupDelegate()
    }

    // 네비게이션 바 설정
    private func configureNavigationBar() {
        let backButtonImage = UIImage(named: "backImage 1")?.withRenderingMode(.alwaysOriginal)
        let resizedBackButtonImage = resizeImage(image: backButtonImage, targetSize: CGSize(width: 24, height: 24))

        let backButton = UIBarButtonItem(image: resizedBackButtonImage, style: .done, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }

    // 버튼 설정
    private func configureButtons() {
        searchView.buyButton.addTarget(self, action: #selector(didTapBuyButton), for: .touchUpInside)
    }

    private func setupDelegate() {
        searchView.matinCollectionView.dataSource = self
        searchView.matinCollectionView.delegate = self
    }

    // 뒤로가기 버튼 액션
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    // 구매 버튼 액션
    @objc private func didTapBuyButton() {
        let modalVC = SellViewController()
        modalVC.modalPresentationStyle = .pageSheet
        present(modalVC, animated: true, completion: nil)
    }

    // 이미지 리사이즈
    private func resizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else { return nil }

        let size = image.size
        let widthRatio = targetSize.width / size.width
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
        return SearchModel.dummy().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: matinCollectionViewCell.identifier,
            for: indexPath
        ) as? matinCollectionViewCell else {
            return UICollectionViewCell()
        }

        let model = SearchModel.dummy()[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 53, height: 53)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
}

// MARK: - matinCollectionViewCell Extension
extension matinCollectionViewCell {
    func configure(with model: SearchModel) {
        matinView.image = model.searchImage
    }
}

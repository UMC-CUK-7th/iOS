//
//  DetailPageViewController.swift
//  KREAM
//
//  Created by 류한비 on 11/4/24.
//

import UIKit

class DetailPageViewController: UIViewController {
    
    private lazy var detailPageView: DetailPageView = {
        let view = DetailPageView()
        view.detailPageCollectionView.dataSource = self
        return view
    }()
    
    override func loadView() {
        self.view = detailPageView
    }
    
    // navigation바
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        purchaseButtonAction()
    }
    
    // navigation바 설정
    private func setNavigationBar(){
        let backButton = UIImage(systemName: "arrow.left") //뒤로가기 버튼 이미지
        self.navigationController?.navigationBar.backIndicatorImage = backButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        self.navigationController?.navigationBar.tintColor = .gray
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "" //버튼 타이틀 없음
    }
    
    // 구매버튼 액션
    private func purchaseButtonAction() {
        detailPageView.redButton.addTarget(self, action: #selector (purchaseButtonDidTap), for: .touchUpInside)
    }
    
    // 구매버튼 클릭시 화면 전환 (modal) + 이미지 전달
    @objc
    private func purchaseButtonDidTap() {
        let button = ProductPurchaseViewController()
        button.modalPresentationStyle = .automatic
        present(button, animated: true)
        button.productImage = detailPageView.productImage.image // 이미지 전달
    }
    
}

//MARK: - UICollectionView DataSource
extension DetailPageViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DetailPageModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailPageCollectionViewCell.identifier, for: indexPath) as? DetailPageCollectionViewCell else { return UICollectionViewCell() }
        let list = DetailPageModel.dummy()
        cell.productCellImage.image = list[indexPath.row].image
        return cell
    }
}

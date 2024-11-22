//
//  JustDroppedDetailViewController.swift
//  KREAM
//
//  Created by 서재민 on 11/6/24.
//

import UIKit

class JustDroppedDetailViewController: UIViewController {
    
    //MARK: - property
    private let justDroppedDetailView = JustDroppedDetailView()
    public var recievedData : UIImage?

    
    //MARK: -LifeCycle
    override func loadView() {
        self.view = justDroppedDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        justDroppedDetailView.productColorCollectionView.delegate = self
        justDroppedDetailView.productColorCollectionView.dataSource = self
        justDroppedDetailView.purchaseButton.addTarget(self, action: #selector(purchaseButtonDidTap), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationController()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    
    //MARK: - Function
    
    //상단 네비게이션
    private func setNavigationController() {
        self.navigationController?.navigationBar.tintColor = .black
        let backButtonImage = UIImage(systemName: "arrow.left")
        self.navigationController?.navigationBar.backIndicatorImage = backButtonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
 
    
    
    
    @objc private func purchaseButtonDidTap(){
        let button = PurchaseButtonTapViewController()
        button.modalPresentationStyle = .automatic
        
        let navVc = UINavigationController(rootViewController: button)
        present(navVc,animated: true,completion: nil)
        
    }
    
    }


//MARK: - Extension
extension JustDroppedDetailViewController :  UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProductColorModel.ProductColorDummy().count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductColorCell", for: indexPath) as! ProductColorCell
        let list = ProductColorModel.ProductColorDummy()
        cell.imageView.image = list[indexPath.row].image
        return cell
    }
}

extension JustDroppedDetailViewController :  UICollectionViewDelegateFlowLayout{
    
}

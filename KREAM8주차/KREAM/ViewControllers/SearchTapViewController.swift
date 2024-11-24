//
//  SearchTapViewController.swift
//  KREAM
//
//  Created by 서재민 on 11/20/24.
//

import UIKit

class SearchTapViewController: UIViewController {

    //MARK: - Properties
    
    let searchTapView = SearchTapView()
    
    //MARK: - LifeCycle
    
    override func loadView() {
        self.view = searchTapView
        
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTapView.recommendationCollectionView.dataSource = self
        searchTapView.recommendationCollectionView.delegate = self
        setupNavigationBar()
        
        self.searchTapView.searchButton.addTarget(self, action: #selector(searchbuttonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       

    }
    

    //MARK: - Func
    private func setupNavigationBar() {
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.rightBarButtonItem = cancelButton
        navigationController?.navigationBar.tintColor = .black

       }
       
    
       @objc func cancelButtonTapped() {
           self.navigationController?.popViewController(animated: true)
           print(#function)
       }
   
    
    @objc private func searchbuttonTapped() {
        let VC = SearchDetailViewController()
        self.navigationController?.pushViewController(VC, animated: true)
        VC.view.backgroundColor = .white
    }

    
    
}


//MARK: - Extension
extension SearchTapViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendLabelCell", for: indexPath)as! RecommendLabelCell
        let recommendLabelModel = RecommendLabelModel.dummy()[indexPath.row]
        cell.label.text = recommendLabelModel.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecommendLabelModel.dummy().count
    }
}

extension SearchTapViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let topBottominset: CGFloat = 8// 셀의 상하 여백
        let leftRightInset: CGFloat = 12 // 셀의 좌우 여백
        let cellHeight : CGFloat = 16 + topBottominset*2 //셀의 총 높이: 컨텐츠 높이+ 여백
        let recommendLabelModel = RecommendLabelModel.dummy()[indexPath.row]
        let size: CGSize = .init(width: collectionView.frame.width - 10, height: cellHeight)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13.5, weight: .regular)] //폰트및 사이즈설정
        let estimatedFrame = recommendLabelModel.title.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        let cellWidth: CGFloat = estimatedFrame.width + (leftRightInset * 2) //셀의 총 너비 : 각 타이틀+ 여백

        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 8
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }// 간격이 안맞으
}


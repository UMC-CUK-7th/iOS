//
//  SearchViewController.swift
//  KREAM
//
//  Created by 류한비 on 10/23/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var searchView: SearchView = {
        let view = SearchView()
        view.searchCollectionView.dataSource = self //데이터 바인딩
        return view
    }()
    
    override func loadView() {
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButtonAction()
        searchTextFieldAction()
    }
    
    //MARK: - 취소버튼
    
    // 취소 버튼 액션
    private func cancelButtonAction() {
        searchView.cancleButton.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
    }
    
    // 취소 버튼 클릭시 homeView로 전환
    @objc
    private func cancelButtonDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - 텍스트필드 화면전환
    
    // search 텍스트 필드 액션
    private func searchTextFieldAction() {
        searchView.searchTextField.addTarget(self, action: #selector (textfieldDidTap), for: .editingDidBegin)
    }
    
    // search 텍스트 필드 클릭시 화면 전환
    @objc
    private func textfieldDidTap() {
        let td = SearchDetailViewController()
        td.modalPresentationStyle = .fullScreen
        present(td, animated: true)
    }
    
}

// MARK: - UICollectionView DataSource
extension SearchViewController: UICollectionViewDataSource{
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SearchModel.dummy().count
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        let list = SearchModel.dummy()
        cell.searchLabel.text = list[indexPath.row].label
        return cell
    }
}

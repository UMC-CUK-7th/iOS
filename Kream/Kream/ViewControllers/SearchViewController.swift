//
//  SearchViewController.swift
//  KREAM
//
//  Created by 류한비 on 10/23/24.
//

import UIKit

class SearchViewController: UIViewController {
    let searchView = SearchView()
    
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
    
    //MARK: - 텍스트필드 화면전화
    
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

//
//  SearchDetailViewController.swift
//  KREAM
//
//  Created by 류한비 on 11/19/24.
//

import UIKit

class SearchDetailViewController: UIViewController {
    let searchDetailView = SearchDetailView()
    
    override func loadView() {
        self.view = searchDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButtonAction()
        backButtonAction()
    }
    //MARK: - 취소버튼
    // 취소 버튼 액션
    private func cancelButtonAction() {
        searchDetailView.cancleButton.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
    }
    
    // 취소 버튼 클릭시 homeView로 전환
    @objc
    private func cancelButtonDidTap() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - 뒤로가기 버튼
    // 뒤로가기 버튼 액션
    private func backButtonAction() {
        searchDetailView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    // 뒤로가기 버튼 클릭시 검색화면으로 전환
    @objc
    private func backButtonDidTap() {
        dismiss(animated: true, completion: nil)
    }
}

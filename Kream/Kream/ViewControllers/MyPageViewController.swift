//
//  MyPageViewController.swift
//  KREAM
//
//  Created by 류한비 on 10/7/24.
//
import UIKit

class MyPageViewController: UIViewController {
    let myPageView = MyPageView()
    
    override func loadView() {
        self.view = myPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAction()
    }
    
    // 프로필 관리 버튼 액션연결
    private func buttonAction(){
        myPageView.editProfileButton.addTarget(self, action: #selector(editProfileButtonDidTap), for: .touchUpInside)
    }
    
    // 프로필 관리 버튼 (Navigation)
    @objc
    private func editProfileButtonDidTap(){
        let ep = EditProfileViewController()
        navigationController?.pushViewController(ep, animated: true)
    }
    
}



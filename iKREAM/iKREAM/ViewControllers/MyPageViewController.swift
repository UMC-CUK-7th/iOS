//
//  MyPageViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 10/7/24.
//

import UIKit

class MyPageViewController: UIViewController {
    // MARK: - Properties
    let myPageView = MyPageView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = myPageView  // 인스턴스를 할당
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setButtonActions()
    }
    
    // MARK: - Set Button Actions
    private func setButtonActions() {
        myPageView.manageProfileButton.addTarget(self, action: #selector(didTapManageProfileButton), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc
    private func didTapManageProfileButton() {
        let manageProfileVC = ManageProfileViewController()
        self.navigationController?.pushViewController(manageProfileVC, animated: true)
        /*
         지금 self(MyPageViewController)에 navigationController가 있다면
         pushViewController방식으로 화면 전환
         */
        
    }
}

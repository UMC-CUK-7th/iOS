//
//  MyPageViewController.swift
//  KreamCloneCoding
//
//  Created by 김승원 on 9/27/24.
//

// 워크북 2주차

import UIKit

class MyPageViewController: UIViewController {
    // MARK: - Properties
    let myPageView = MyPageView()

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = myPageView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonActions()
    }
    
    // MARK: - Set NavigationBar
    private func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
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

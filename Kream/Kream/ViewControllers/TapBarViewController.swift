//
//  TapBarViewController.swift
//  KREAM
//
//  Created by 류한비 on 10/7/24.
//

import UIKit

class TapBarViewController: UITabBarController {
    
    private let homeVC = HomeViewController()
    private let styleVC = UIViewController()
    private let shopVC = UIViewController()
    private let savedlVC = SavedViewController()
    private let myVC =  UINavigationController(rootViewController: MyPageViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tapbarVC()
    }
    
    //MARK: TabBar setup
    private func tapbarVC(){
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(systemName: "house"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(systemName: "heart"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        savedlVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(systemName: "bookmark"), tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(systemName: "person"), tag: 4)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(systemName: "person"), tag: 4)
        self.viewControllers = [homeVC, styleVC, shopVC, savedlVC, myVC]
        // 탭바 아이템 색상 변경(선택된 항목)
        tabBar.tintColor = .black
        
    }
}

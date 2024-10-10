//
//  TabBarViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 10/7/24.
//

import UIKit
import SnapKit

class RootTabBarController: UITabBarController {
    // MARK: - Properties
    let homeViewController = UIViewController() //실제 구현 안되도 됨.(노션기준)
    let styleViewController = UIViewController()
    let shopViewController = UIViewController()
    let savedViewController = UIViewController()
    
    // navigationController를 심어줘야 함
    let myPageViewController = UINavigationController(rootViewController: MyPageViewController())
    /*
     rootViewController - UINavigationController는 여러개의 UIViewController를 관리한다. 그 중에서 제일 처음(뿌리)가 되는 UIViewController를 말한다.
     */
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarController()
    }

    // MARK: - Set up TabBarController
    private func setupTabBarController() {
        homeViewController.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "homeIcon"), tag: 0)
        styleViewController.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "styleIcon"), tag: 1)
        shopViewController.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "shopIcon"), tag: 2)
        savedViewController.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "savedIcon"), tag: 3)
        myPageViewController.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "myIcon"), tag: 4)
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black // 탭바를 눌렀을 때 틴트 컬러 설정
        
        self.viewControllers = [homeViewController, styleViewController, shopViewController, savedViewController, myPageViewController]
    }
}

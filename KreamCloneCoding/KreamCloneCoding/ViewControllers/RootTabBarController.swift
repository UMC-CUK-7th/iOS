//
//  RootTabBarController.swift
//  KreamCloneCoding
//
//  Created by 김승원 on 9/27/24.
//

// 워크북 2주차

import UIKit
import SnapKit

class RootTabBarController: UITabBarController {
    // MARK: - Properties
    // 아래 4개는 필요 없는 ViewController
    let homeViewController = UIViewController()
    let styleViewController = UIViewController()
    let shopViewController = UIViewController()
    let savedViewController = UIViewController()
    
    // navigationController를 심어줘야 함
    let myPageViewController = UINavigationController(rootViewController: MyPageViewController())
    /*
     rootViewController란?
     
     UINavigationController는 여러개의 UIViewController를 관리함
     그 중에서 제일 처음(뿌리)가 되는 UIViewController를 말함
     */
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarController()
    }

    // MARK: - Set up TabBarController
    private func setupTabBarController() {
        // 각 ViewController의 tabBarItem과 tag를 설정
        homeViewController.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(systemName: "house"), tag: 0)
        styleViewController.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(systemName: "text.page"), tag: 1)
        shopViewController.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        savedViewController.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(systemName: "bookmark"), tag: 3)
        myPageViewController.tabBarItem = UITabBarItem(title: "MY", image: UIImage(systemName: "person"), tag: 4)
        /*
         tag는 뭔가요?
         
         tag는 탭 바의 탭을 구분하기 위한 요소(고유 번호, 고유 ID)
         */
        
        self.tabBar.backgroundColor = .white // 탭바의 배경색 설정
        self.tabBar.tintColor = .black // 탭바를 눌렀을 때 틴트 컬러 설정
        
        // 탭바가 관리하는 ViewController들 설정
        self.viewControllers = [homeViewController, styleViewController, shopViewController, savedViewController, myPageViewController]
    }
}

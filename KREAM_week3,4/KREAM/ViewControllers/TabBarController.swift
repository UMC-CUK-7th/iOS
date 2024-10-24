//
//  TabBarController.swift
//  KREAM
//
//  Created by 서재민 on 10/6/24.
//

import UIKit
class TabBarController: UITabBarController {
    let HomeVC = HomeViewController() //인스턴스화
    let StyleVC = UIViewController()
    let ShopVC = UIViewController()
    let SavedVC = SavedViewController()
    let MyPageVC = UINavigationController(rootViewController: MypageViewcontroller())
   

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let nav3 = UINavigationController(rootViewController: MyPageVC)
        HomeVC.tabBarItem = UITabBarItem(title: "Home",
                                         image:UIImage(named:"Home.png"),tag:0)
        StyleVC.tabBarItem = UITabBarItem(title: "Style",image: UIImage(named:"Style.png"),tag:1)
        ShopVC.tabBarItem = UITabBarItem(title: "Shop",image: UIImage(named:"Shop.png"),tag:2)
        SavedVC.tabBarItem = UITabBarItem(title: "Saved",image: UIImage(named:"Saved.png"),tag:3)
        MyPageVC.tabBarItem = UITabBarItem(title: "My",image: UIImage(named:"My.png"),tag:4)
        
        
        self.tabBar.tintColor = .black 
        self.viewControllers = [HomeVC,StyleVC,ShopVC,SavedVC,MyPageVC]
        // Do any additional setup after loading the view.
    }
  
    
    
  
    
}

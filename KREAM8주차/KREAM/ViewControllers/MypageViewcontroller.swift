//
//  MypageViewcontroller.swift
//  KREAM
//
//  Created by 서재민 on 10/6/24.
//

import UIKit

class MypageViewcontroller: UIViewController {
    let Mypage = MypageView()
    
    
    override func loadView() {
        self.view = Mypage
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.Mypage.ProfileManageButton.addTarget(self, action: #selector(ManageButtonDidTap), for: .touchUpInside)
        
        
    }
    
    @objc
        private func ManageButtonDidTap(){
         let VC = ProfileManageViewController()
            VC.view.backgroundColor = .white
            self.navigationController?.pushViewController(VC, animated: true)
            
            VC.recievedData = Mypage.ProfileImage.image
        }

   
}

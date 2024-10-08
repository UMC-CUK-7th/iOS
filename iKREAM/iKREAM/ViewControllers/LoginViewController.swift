//
//  ViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 9/26/24.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    let loginView = LoginView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = loginView // viewController의 view를 loginView로 연동
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setButtonActions()
    }
    
    // 화면의 빈곳을 터치한 경우에 키보드를 내리는 코드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Set Button Actions
    // 워크북 2주차
    private func setButtonActions() {
        self.loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside) // 버튼 액션 추가
    }
    
    // MARK: - Selectors
    @objc
    private func didTapLoginButton() {
        let rootTabBarVC = RootTabBarController()
        print(#function)
        rootTabBarVC.modalPresentationStyle = .fullScreen
        self.present(rootTabBarVC, animated: true, completion: nil) // present로 화면 전환
        
    }
    
    
}

/*import UIKit
 
 class LoginViewController: UIViewController {
 let loginView = LoginView()
 
 override func loadView() {
 self.view = loginView
 }
 
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view.
 }
 
 
 }*/

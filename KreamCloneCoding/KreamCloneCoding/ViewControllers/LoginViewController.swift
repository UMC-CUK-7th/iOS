//
//  LoginViewController.swift
//  KreamCloneCoding
//
//  Created by 김승원 on 9/25/24.
//

// 위크북 1주차 

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
        /*
         #selector가 뭔가요?
         
         특정 매서드를 호출하기 위해 사용되는 키워드입니다
         특정 이벤트가 일어났을 때 나중에 실행될(호출할) 함수를 미리 정해두는 것!
         */
    }

    // MARK: - Selectors
    @objc
    private func didTapLoginButton() {
        let rootTabBarVC = RootTabBarController()
        print(#function)
        rootTabBarVC.modalPresentationStyle = .fullScreen // 모달 방식을 전체회면으로 설정
        self.present(rootTabBarVC, animated: true, completion: nil) // present로 화면 전환
        
    }
    /*
     @objc 키워드는 뭔가요?
     
     iOS 개발을 하다보면 애플의 오래된 프로그래밍 언어인 Objective-C와 함께 작동하는 경우가 있음
     대표적인 경우가 버튼을 눌렀을 때 어떤 일이 일어나는지 처리할 때!!
     이 경우에 @objc키워드를 앞에 붙이면 Swift코드도 Objective-C와 소통을 잘 해주는 통역사 역할을 해줌
     
     결론) 버튼 눌렸을 때 실행할 함수는 @objc를 붙여서 구현
     */

}


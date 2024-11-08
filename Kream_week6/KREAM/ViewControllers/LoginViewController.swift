//
//  ViewController.swift
//  KREAM
//
//  Created by 서재민 on 10/2/24.
//

import UIKit

class LoginViewController: UIViewController {
    private let userDefaultsModel = UserDefaultsModel()
    let loginView = LoginView()
    var data : LoginModel = LoginModel(id:"", pwd: "")
    
    override func loadView () {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.LoginButton.addTarget(self, action: #selector(buttondidTap),for: .touchUpInside)
    

    }
    
    
    @objc
    private func buttondidTap(){
        let VC = TabBarController()
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true, completion: nil)
       
        guard let text = loginView.idTextField.text, !text.isEmpty else { return }
        userDefaultsModel.SaveUserEmail(text)
        guard let Pw = loginView.PWDTextField.text, !Pw.isEmpty else { return }
        userDefaultsModel.SaveUserPassword(Pw)
        
    }
   
}




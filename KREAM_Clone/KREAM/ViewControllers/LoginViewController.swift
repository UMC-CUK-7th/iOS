//
//  ViewController.swift
//  KREAM
//
//  Created by 서재민 on 10/2/24.
//

import UIKit

class LoginViewController: UIViewController {
    var data : LoginModel = LoginModel(id:"", pwd: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = counterView
    }
    
    private lazy var counterView: LoginView = {
        let view = LoginView()
        view.IDLabel.text = data.id
        view.PWDLabel.text = data.pwd
        return view
    }()
    
}




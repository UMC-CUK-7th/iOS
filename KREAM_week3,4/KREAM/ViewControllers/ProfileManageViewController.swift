//
//  ProfileManageViewController.swift
//  KREAM
//
//  Created by 서재민 on 10/6/24.
//

import UIKit

class ProfileManageViewController: UIViewController {
    
    
    public var recievedData: UIImage?
    
    
    let ProfileManageView = ProfileManageview()
    let userDefaultsModel = UserDefaultsModel()
    
    
    override func loadView(){
        self.view = ProfileManageView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationController()
        setProfileImage()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadEmailValue()
        LoadPWDValue()
        self.ProfileManageView.ChangeEmailButton.addTarget(self, action: #selector(didTapChangeEmailButton), for: .touchUpInside)
        self.ProfileManageView.ChangePasswordButton.addTarget(self, action: #selector(didTapChangePasswordButton), for: .touchUpInside)
      
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func setProfileImage() {
        if let data = recievedData {
            ProfileManageView.profileManageImage.image = data
        }
    }
    
    private func setNavigationController() {
        self.title = "프로필 관리"
        self.navigationController?.navigationBar.tintColor = .black
        let backButtonImage = UIImage(systemName: "arrow.left")
        self.navigationController?.navigationBar.backIndicatorImage = backButtonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    
    @objc
    private func didTapChangeEmailButton() {
        if !(ProfileManageView.UserEmailTextField.isEnabled){
            ProfileManageView.ChangeEmailButton.setTitle("확인", for: .normal)
            ProfileManageView.UserEmailTextField.isEnabled = true
            ProfileManageView.UserEmailTextField.becomeFirstResponder()
            guard let text = ProfileManageView.UserEmailTextField.text, !text.isEmpty else { return }
            userDefaultsModel.SaveUserEmail(text)
        }
        else{
            ProfileManageView.ChangeEmailButton.setTitle("변경", for: .normal)
            ProfileManageView.UserEmailTextField.isEnabled = false
        }
        
    }
    
    @objc
    private func didTapChangePasswordButton() {
        if !(ProfileManageView.ChangePasswordTextField.isEnabled){
            ProfileManageView.ChangePasswordButton.setTitle("확인", for: .normal)
            ProfileManageView.ChangePasswordTextField.isEnabled = true
            ProfileManageView.ChangePasswordTextField.becomeFirstResponder()
            guard let pwd = ProfileManageView.ChangePasswordTextField.text, !pwd.isEmpty else { return }
            userDefaultsModel.SaveUserPassword(pwd)
        }
        else{
            ProfileManageView.ChangePasswordButton.setTitle("변경", for: .normal)
            ProfileManageView.ChangePasswordTextField.isEnabled = false
        }
    }
    
    @objc
    private func LoadEmailValue(){
        if let savedEmail = userDefaultsModel.loadUserEmail(){
            ProfileManageView.UserEmailTextField.text = savedEmail
        }
    }
    
    @objc
    private func LoadPWDValue(){
        if let savedPWD = userDefaultsModel.loadUserPassword(){
            ProfileManageView.ChangePasswordTextField.text = savedPWD
        }
    }
}

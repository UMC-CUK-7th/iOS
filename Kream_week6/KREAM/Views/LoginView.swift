//
//  LoginView.swift
//  KREAM
//
//  Created by 서재민 on 10/2/24.
//

import UIKit


class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        
    }
    private func addComponents(){
        self.addSubview(imageView)
        self.addSubview(IDLabel)
        self.addSubview(idTextField)
        self.addSubview(PWDLabel)
        self.addSubview(PWDTextField)
        self.addSubview(LoginButton)
        self.addSubview(KakaoLoginButton)
        self.addSubview(AppleLoginButton)
        self.addSubview(KakaoLoginImage)
        self.addSubview(AppleLoginImage)
            //여기에 오토레이아웃 적기
    
    NSLayoutConstraint.activate([
        //UIImage 제약
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126) ,
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53),
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -53),
        imageView.heightAnchor.constraint(equalToConstant:75),
        
        // IDLabel 제약 설정
        IDLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 87),
        IDLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
        IDLabel.heightAnchor.constraint(equalToConstant: 15),
        
        // idTextField 제약 설정
        idTextField.topAnchor.constraint(equalTo: IDLabel.bottomAnchor, constant: 8),
        idTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
        idTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
        idTextField.heightAnchor.constraint(equalToConstant:34),
        
        // PWDLabel 제약 설정
        PWDLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant:17),
        PWDLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
        PWDLabel.heightAnchor.constraint(equalToConstant: 15),
        // PWDTextField 제약 설정
        PWDTextField.topAnchor.constraint(equalTo: PWDLabel.bottomAnchor, constant: 8),
        PWDTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
        PWDTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
        PWDTextField.heightAnchor.constraint(equalToConstant:34),
        
        // LoginButton 제약 설정
        LoginButton.topAnchor.constraint(equalTo: PWDTextField.bottomAnchor,constant:17),
        LoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
        LoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
        LoginButton.heightAnchor.constraint(equalToConstant:38),
        
        // kakao 제약
        KakaoLoginButton.topAnchor.constraint(equalTo: LoginButton.bottomAnchor,constant:87),
        KakaoLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
        KakaoLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
        KakaoLoginButton.heightAnchor.constraint(equalToConstant:40),
        
        //Apple 제약
        AppleLoginButton.topAnchor.constraint(equalTo: KakaoLoginButton.bottomAnchor,constant:22),
        AppleLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
        AppleLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
        AppleLoginButton.heightAnchor.constraint(equalToConstant:40),
        
        
        KakaoLoginImage.topAnchor.constraint(equalTo: KakaoLoginButton.topAnchor,constant:13),
        KakaoLoginImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
        KakaoLoginImage.heightAnchor.constraint(equalToConstant:15),
        KakaoLoginImage.widthAnchor.constraint(equalToConstant:15),
        
        AppleLoginImage.topAnchor.constraint(equalTo: AppleLoginButton.topAnchor,constant:13),
        AppleLoginImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
        AppleLoginImage.heightAnchor.constraint(equalToConstant:15),
        AppleLoginImage.widthAnchor.constraint(equalToConstant:15)
       
    ])
}
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    
        private lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "KREAMLogo.png")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        
        
        //이메일주소Label아이디
    let IDLabel: UILabel = {
            let IDlabel = UILabel()
            IDlabel.text="이메일 주소"
            IDlabel.font = .systemFont(ofSize: 12, weight: .regular)
            IDlabel.textColor = .black
            IDlabel.numberOfLines = 1
            IDlabel.textAlignment = .left
            
            IDlabel.translatesAutoresizingMaskIntoConstraints = false
            return IDlabel
        }()
        
        //아이디 TextField
        lazy var idTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "예)kream@kream.co.kr"
            textField.borderStyle = .none
            textField.font = UIFont.systemFont(ofSize: 12, weight: .regular) //bold에서 교체해야함
            textField.textColor = UIColor (hex: "#C1C1C1")
            textField.layer.borderColor = UIColor (hex: "A2A2A2").cgColor
            textField.layer.borderWidth = 1.0
            textField.layer.cornerRadius = 15.0
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
            textField.leftViewMode = .always
            return textField
        }()
        
       
        //비밀번호Label
        let PWDLabel: UILabel = {
            let PWDlabel = UILabel()
            
            PWDlabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            PWDlabel.textColor = UIColor.black
            PWDlabel.text="비밀번호"
            PWDlabel.textAlignment = .left
            PWDlabel.translatesAutoresizingMaskIntoConstraints = false
            return PWDlabel
        }()
        
        //비밀번호 Textfield
         lazy var PWDTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "비밀번호를 입력해주세요"
            textField.textColor = UIColor (hex: "#C1C1C1")
            textField.borderStyle = .none
            textField.layer.borderColor = UIColor (hex: "#A2A2A2").cgColor
            textField.font = UIFont.systemFont(ofSize: 12, weight: .bold) //bold에서 교체해야함
            textField.layer.borderWidth = 1.0
            textField.layer.cornerRadius = 15.0
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))  //leftview가 존재한다..
            textField.leftViewMode = .always
            return textField
            
        }()
        
        
        // 로그인 버튼
        public lazy var LoginButton: UIButton = {
            let btn = UIButton()
            btn.setTitle("로그인", for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            btn.setTitleColor(.white,for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = .lightGray
            btn.layer.borderColor = UIColor (hex: "#A2A2A2").cgColor
            btn.layer.borderWidth = 2.0
            btn.layer.cornerRadius = 10.0
            btn.layer.masksToBounds = true
            
            return btn
        }()
        
    //카카오로그인버튼
    public lazy var KakaoLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("카카오로 로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        btn.setTitleColor(.black,for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = UIColor (hex: "#A2A2A2").cgColor
        btn.layer.borderWidth = 2.0
        btn.layer.cornerRadius = 10.0
        btn.layer.masksToBounds = true
        return btn
    }()
    
    let KakaoLoginImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //애플로그인버튼
    public lazy var AppleLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Apple로 로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        btn.setTitleColor(.black,for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = UIColor (hex: "#A2A2A2").cgColor
        btn.layer.borderWidth = 2.0
        btn.layer.cornerRadius = 10.0
        btn.layer.masksToBounds = true
        
        return btn
    }()
    
    let AppleLoginImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppleLogo.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    }


//
//  LoginView.swift
//  KREAM
//
//  Created by 서재민 on 10/2/24.
//

import UIKit

//색상
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        
    }
    private func addComponents(){
        self.addSubview(imageView)
        self.addSubview(LoginContainerView)
        LoginContainerView.addSubview(EmailContainerView)
        LoginContainerView.addSubview(PWDContainerView)
        LoginContainerView.addSubview(LoginButton)
        EmailContainerView.addSubview(IDLabel)
        EmailContainerView.addSubview(idTextField)
        PWDContainerView.addSubview(PWDLabel)
        PWDContainerView.addSubview(PWDTextField)
        //여기에 오토레이아웃 적기
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 53),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 53),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 651),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 287),
            imageView.heightAnchor.constraint(equalToConstant: 75),

                       // LoginContainerView 제약 설정
            
                 // LoginContainerView 제약 설정
                 LoginContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 288),
                 LoginContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
                 LoginContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
                 LoginContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -378),

                 // EmailContainerView 제약 설정
                 EmailContainerView.topAnchor.constraint(equalTo: LoginContainerView.topAnchor),
                 EmailContainerView.leadingAnchor.constraint(equalTo: LoginContainerView.leadingAnchor),
                 EmailContainerView.trailingAnchor.constraint(equalTo: LoginContainerView.trailingAnchor),
                 EmailContainerView.heightAnchor.constraint(equalToConstant: 129), // 높이 고정

                 // PWDContainerView 제약 설정
                 PWDContainerView.topAnchor.constraint(equalTo: EmailContainerView.bottomAnchor, constant: 20),
                 PWDContainerView.leadingAnchor.constraint(equalTo: LoginContainerView.leadingAnchor),
                 PWDContainerView.trailingAnchor.constraint(equalTo: LoginContainerView.trailingAnchor),
                 PWDContainerView.heightAnchor.constraint(equalToConstant: 55), // 높이 고정

                 // IDLabel 제약 설정
                 IDLabel.topAnchor.constraint(equalTo: EmailContainerView.topAnchor, constant: 10),
                 IDLabel.leadingAnchor.constraint(equalTo: EmailContainerView.leadingAnchor, constant: 10),
                 IDLabel.trailingAnchor.constraint(equalTo: EmailContainerView.trailingAnchor, constant: -10),
                 

                 // idTextField 제약 설정
                 idTextField.topAnchor.constraint(equalTo: IDLabel.bottomAnchor, constant: 10),
                 idTextField.leadingAnchor.constraint(equalTo: EmailContainerView.leadingAnchor, constant: 10),
                 idTextField.trailingAnchor.constraint(equalTo: EmailContainerView.trailingAnchor, constant: -10),
                 idTextField.heightAnchor.constraint(equalToConstant: 40),

                 // PWDLabel 제약 설정
                 PWDLabel.topAnchor.constraint(equalTo: PWDContainerView.topAnchor, constant: 10),
                 PWDLabel.leadingAnchor.constraint(equalTo: PWDContainerView.leadingAnchor, constant: 10),
                 PWDLabel.trailingAnchor.constraint(equalTo: PWDContainerView.trailingAnchor, constant: -10),

                 // PWDTextField 제약 설정
                 PWDTextField.topAnchor.constraint(equalTo: PWDLabel.bottomAnchor, constant: 10),
                 PWDTextField.leadingAnchor.constraint(equalTo: PWDContainerView.leadingAnchor, constant: 10),
                 PWDTextField.trailingAnchor.constraint(equalTo: PWDContainerView.trailingAnchor, constant: -10),
                 PWDTextField.heightAnchor.constraint(equalToConstant: 40),

                 // LoginButton 제약 설정
                 LoginButton.topAnchor.constraint(equalTo: PWDContainerView.bottomAnchor, constant: 20),
                 LoginButton.leadingAnchor.constraint(equalTo: LoginContainerView.leadingAnchor),
                 LoginButton.trailingAnchor.constraint(equalTo: LoginContainerView.trailingAnchor),
                 LoginButton.heightAnchor.constraint(equalToConstant: 50)
             ])
         }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var imageView: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "KREAMLogo.png") // 여기에 원하는 이미지 파일명 입력
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    
    
    //아이디,패스워드 로그인버튼의 컨테이너
    private lazy var LoginContainerView: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    // 이메일 작성 컨테이너
    private lazy var EmailContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //이메일주소Label아이디
    public lazy var IDLabel: UILabel = {
        let IDlabel = UILabel()
        IDlabel.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        IDlabel.textColor = UIColor.black
        IDlabel.text="이메일 주소"
        IDlabel.textAlignment = .left
        IDlabel.translatesAutoresizingMaskIntoConstraints = false
        return IDlabel
    }()
    
    //아이디 TextField
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        layer.borderColor = UIColor.systemBlue.cgColor
        textField.placeholder = "예)kream@kream.co.kr"
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 12, weight: .bold) //bold에서 교체해야함
        textField.textColor = UIColor (hex: "#C1C1C1")
        textField.layer.borderColor = UIColor (hex: "A2A2A2").cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 15.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        //패딩추가? , 필드안에 텍스트 레이아웃조정
        return textField
    }()
    
    //비밀번호 프레임
    public lazy var PWDContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //비밀번호Label
    public lazy var PWDLabel: UILabel = {
        let PWDlabel = UILabel()
        
        PWDlabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        PWDlabel.textColor = UIColor.black
        PWDlabel.text="비밀번호"
        PWDlabel.textAlignment = .left
        PWDlabel.translatesAutoresizingMaskIntoConstraints = false
        return PWDlabel
    }()
    
    //비밀번호 Textfield
    private lazy var PWDTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.textColor = UIColor (hex: "#C1C1C1")
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor (hex: "#A2A2A2").cgColor
        textField.font = UIFont.systemFont(ofSize: 12, weight: .bold) //bold에서 교체해야함
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 15.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        //패딩추가? , 필드안에 텍스트 레이아웃조정
        return textField
        
    }()
    
    // 버튼 내부 텍스트 폰트
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14)
        container.foregroundColor = UIColor.white
        return container
    }()
    
    // 로그인 버튼
    public lazy var LoginButton: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString("로그인",attributes :  titleContainer)
        configuration.titleAlignment = .center
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = UIColor (hex: "D9D9D9").cgColor
        btn.layer.borderWidth = 2.0
        btn.layer.cornerRadius = 10.0
        btn.layer.masksToBounds = true

        return btn
    }()
    
    
    
}
